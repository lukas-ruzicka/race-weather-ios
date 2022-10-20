//
//  MockWeatherRepositoryHourly.swift
//  
//
//  Created by Lukas Ruzicka on 20.10.2022.
//

import CoreLocation
import DomainLayer

final class MockWeatherRepositoryHourly {}

// MARK: - Protocol conformance
extension MockWeatherRepositoryHourly: WeatherRepository {

    func getAvailableDetailLevel(for location: CLLocation, at dateRange: ClosedRange<Date>) async throws -> WeatherDetailLevel? {
        .hourly
    }

    func getDailyForecast(for location: CLLocation, at dateRange: ClosedRange<Date>) async throws -> [Forecast] {
        []
    }

    func getHourlyForecast(for location: CLLocation, at dateRange: ClosedRange<Date>) async throws -> [Forecast] {
        []
    }

    func getRainDetail(for location: CLLocation, at dateRange: ClosedRange<Date>) async throws -> [RainDetail] {
        []
    }
}
