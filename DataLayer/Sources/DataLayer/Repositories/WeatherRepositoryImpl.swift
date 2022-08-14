//
//  WeatherRepositoryImpl.swift
//  
//
//  Created by Lukáš Růžička on 03.08.2022.
//

import CoreLocation
import DomainLayer

final class WeatherRepositoryImpl {}

// MARK: - Protocol conformance
extension WeatherRepositoryImpl: WeatherRepository {

    func getAvailableDetailLevel(for dateRange: ClosedRange<Date>) async throws -> WeatherDetailLevel? {
        [.detailed, .hourly, .daily].randomElement()!
    }

    func getDailyForecast(for location: CLLocation, at dateRange: ClosedRange<Date>) async throws -> [Forecast] {
        try await Task.sleep(nanoseconds: 300_000_000)
        var forecast: [Forecast] = []
        var currentDayDate = dateRange.lowerBound
        repeat {
            forecast.append(.init(date: currentDayDate, weather: .mockRandom))
            currentDayDate = currentDayDate.addingTimeInterval(24 * 60 * 60)
        } while currentDayDate < dateRange.upperBound
        return forecast
    }

    func getHourlyForecast(for location: CLLocation, at dateRange: ClosedRange<Date>) async throws -> [Forecast] {
        try await Task.sleep(nanoseconds: 300_000_000)
        var forecast: [Forecast] = []
        var currentDayDate = dateRange.lowerBound
        repeat {
            forecast.append(.init(date: currentDayDate, weather: .mockRandom))
            currentDayDate = currentDayDate.addingTimeInterval(60 * 60)
        } while currentDayDate < dateRange.upperBound
        return forecast
    }

    func getRainDetail(for location: CLLocation, at dateRange: ClosedRange<Date>) async throws -> [RainDetail] {
        try await Task.sleep(nanoseconds: 1_000_000_000)
        return RainDetail.mock(for: dateRange)
    }
}
