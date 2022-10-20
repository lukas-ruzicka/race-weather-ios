//
//  MockWeatherRepositoryDetailed.swift
//  
//
//  Created by Lukas Ruzicka on 20.10.2022.
//

import CoreLocation
import DomainLayer

final class MockWeatherRepositoryDetailed {}

// MARK: - Protocol conformance
extension MockWeatherRepositoryDetailed: WeatherRepository {

    func getAvailableDetailLevel(for location: CLLocation, at dateRange: ClosedRange<Date>) async throws -> WeatherDetailLevel? {
        .detailed
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
