//
//  WeatherRepositoryImpl.swift
//  
//
//  Created by Lukas Ruzicka on 03.08.2022.
//

import CoreLocation
import DomainLayer

final class WeatherRepositoryImpl {}

// MARK: - Protocol conformance
extension WeatherRepositoryImpl: WeatherRepository {

        [.detailed, .hourly, .daily].randomElement()!
    func getAvailableDetailLevel(for location: CLLocation, at dateRange: ClosedRange<Date>) async throws -> WeatherDetailLevel? {
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
        var currentDayDate = dateRange.lowerBound.addingTimeInterval(-60 * 60)
        repeat {
            forecast.append(.init(date: currentDayDate, weather: .mockRandom, doesPrecedeSession: currentDayDate < dateRange.lowerBound))
            currentDayDate = currentDayDate.addingTimeInterval(60 * 60)
        } while currentDayDate < dateRange.upperBound
        return forecast
    }

    func getRainDetail(for location: CLLocation, at dateRange: ClosedRange<Date>) async throws -> [RainDetail] {
        try await Task.sleep(nanoseconds: 1_000_000_000)
        return RainDetail.mock(for: dateRange)
    }
}
