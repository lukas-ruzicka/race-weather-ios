//
//  WeatherRepositoryImpl.swift
//  
//
//  Created by Lukas Ruzicka on 03.08.2022.
//

import CoreLocation
import DomainLayer
import Utils
import WeatherKit

final actor WeatherRepositoryImpl {

    // MARK: - Subtypes
    enum Failure: Error {

        case missingHourlyForecast
    }

    enum ForecastCache {

        case daily(forecast: [DomainLayer.Forecast])
        case hourly(forecast: [DomainLayer.Forecast])
    }

    // MARK: - Properties
    private let service = WeatherService.shared
    @Injected private var runtimeCache: RuntimeCache
}

// MARK: - Protocol conformance
extension WeatherRepositoryImpl: WeatherRepository {

    func getAvailableDetailLevel(for location: CLLocation, at dateRange: ClosedRange<Date>) async throws -> WeatherDetailLevel? {
        if dateRange.lowerBound.addingTimeInterval(-60 * 60) < Date() {
            try await fetchHourlyIfNeeded(for: location, at: dateRange)
            return .detailed
        }
        if dateRange.lowerBound.addingTimeInterval(-4 * 24 * 60 * 60) < Date() {
            try await fetchHourlyIfNeeded(for: location, at: dateRange)
            return .hourly
        }
        if dateRange.lowerBound.addingTimeInterval(-10 * 24 * 60 * 60) < Date() {
            try await getDailyForecast(for: location, at: dateRange)
            return .daily
        }
        return nil
    }

    @discardableResult
    func getDailyForecast(for location: CLLocation, at dateRange: ClosedRange<Date>) async throws -> [DomainLayer.Forecast] {
        if let cachedDaily = cachedDaily(for: location) {
            return cachedDaily
        }
        return try await fetchDaily(for: location, at: dateRange)
    }

    /// Is using cache only as it currently should have already fetched the hourly forecast for the whole event before in all cases
    func getHourlyForecast(for location: CLLocation, at dateRange: ClosedRange<Date>) async throws -> [DomainLayer.Forecast] {
        let updatedDateRange = dateRange.lowerBound.addingTimeInterval(-60 * 60)...dateRange.upperBound
        guard let cachedHourly = cachedHourly(for: location, at: updatedDateRange),
                !cachedHourly.isEmpty else { throw Failure.missingHourlyForecast }
        if cachedHourly.count > 1 {
            var updatedCachedHourly = cachedHourly
            updatedCachedHourly[0] = .init(date: cachedHourly[0].date,
                                           weather: cachedHourly[0].weather,
                                           doesPrecedeSession: true)
            return updatedCachedHourly
        }
        return cachedHourly
    }

    func getRainDetail(for location: CLLocation, at dateRange: ClosedRange<Date>) async throws -> [RainDetail] {
        guard dateRange.lowerBound.addingTimeInterval(-60 * 60) < Date() else { return [] }
        if let cachedRainDetail = cachedRainDetail(for: location) {
            return cachedRainDetail
        }
        let minuteForecast = try await service.weather(for: location, including: .minute)
        let rainDetail = minuteForecast?.forecast.map { RainDetail(from: $0) } ?? []
        cacheRainDetail(rainDetail, for: location)
        return rainDetail
    }
}

// MARK: - Supporting functions
private extension WeatherRepositoryImpl {

    // MARK: - Daily
    func fetchDaily(for location: CLLocation, at dateRange: ClosedRange<Date>) async throws -> [DomainLayer.Forecast] {
        let dailyForecast = try await service.weather(
            for: location,
            including: .daily(startDate: dateRange.lowerBound, endDate: dateRange.upperBound)
        )
        let forecast = dailyForecast.forecast
            .map { dayWeather in
                DomainLayer.Forecast(
                    date: dayWeather.date,
                    weather: .init(from: dayWeather)
                )
            }
        cacheDaily(forecast, for: location)
        return forecast
    }

    func cacheDaily(_ dailyForecast: [DomainLayer.Forecast], for location: CLLocation) {
        let cache: [CLLocation: [DomainLayer.Forecast]]? = runtimeCache.get(.weatherDailyForecast)
        var updatedCache = cache ?? [:]
        updatedCache[location] = dailyForecast
        runtimeCache.cache(updatedCache, for: .weatherDailyForecast, validity: 60 * 60)
    }

    func cachedDaily(for location: CLLocation) -> [DomainLayer.Forecast]? {
        let cache: [CLLocation: [DomainLayer.Forecast]]? = runtimeCache.get(.weatherDailyForecast)
        return cache?[location]
    }

    // MARK: - Hourly
    func fetchHourlyIfNeeded(for location: CLLocation, at dateRange: ClosedRange<Date>) async throws {
        if let cachedHourly = cachedHourly(for: location, at: dateRange), !cachedHourly.isEmpty {
            return
        }
        let hourlyForecast = try await service.weather(
            for: location,
            including: .hourly(startDate: dateRange.lowerBound.addingTimeInterval(-60 * 60),
                               endDate: dateRange.upperBound)
        )
        let forecast = hourlyForecast.forecast
            .map { hourWeather in
                DomainLayer.Forecast(
                    date: hourWeather.date,
                    weather: .init(from: hourWeather)
                )
            }
        cacheHourly(forecast, for: location)
    }

    func cacheHourly(_ dailyForecast: [DomainLayer.Forecast], for location: CLLocation) {
        let cache: [CLLocation: [DomainLayer.Forecast]]? = runtimeCache.get(.weatherHourlyForecast)
        var updatedCache = cache ?? [:]
        updatedCache[location] = dailyForecast
        runtimeCache.cache(updatedCache, for: .weatherHourlyForecast, validity: 5 * 60)
    }

    func cachedHourly(for location: CLLocation, at dateRange: ClosedRange<Date>) -> [DomainLayer.Forecast]? {
        let cache: [CLLocation: [DomainLayer.Forecast]]? = runtimeCache.get(.weatherHourlyForecast)
        return cache?[location]?
            .filter { $0.date >= dateRange.lowerBound && $0.date < dateRange.upperBound }
    }

    // MARK: - Detailed
    func cacheRainDetail(_ rainDetail: [RainDetail], for location: CLLocation) {
        let cache: [CLLocation: [RainDetail]]? = runtimeCache.get(.weatherRainDetail)
        var updatedCache = cache ?? [:]
        updatedCache[location] = rainDetail
        runtimeCache.cache(updatedCache, for: .weatherRainDetail,
                           validity: rainDetail.isEmpty ? 60 * 60 : 60)
    }

    func cachedRainDetail(for location: CLLocation) -> [RainDetail]? {
        let cache: [CLLocation: [RainDetail]]? = runtimeCache.get(.weatherRainDetail)
        return cache?[location]
    }
}
