//
//  WeatherRepository.swift
//  
//
//  Created by Lukáš Růžička on 30.07.2022.
//

import CoreLocation
import Foundation

public protocol WeatherRepository {

    func getAvailableDetailLevel(for dateRange: ClosedRange<Date>) async throws -> WeatherDetailLevel?

    func getDailyForecast(for location: CLLocation, at dateRange: ClosedRange<Date>) async throws -> [Forecast]
    func getHourlyForecast(for location: CLLocation, at dateRange: ClosedRange<Date>) async throws -> [Forecast]
    func getRainDetail(for location: CLLocation, at dateRange: ClosedRange<Date>) async throws -> [RainDetail]
}
