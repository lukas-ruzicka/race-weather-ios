//
//  WeatherRepositoryImpl.swift
//  
//
//  Created by Lukáš Růžička on 03.08.2022.
//

import CoreLocation
import DomainLayer

final class WeatherRepositoryImpl {

    // MARK: - Properties
    private var availableSeries: [Serie] = Serie.allCases
}

// MARK: - Protocol conformance
extension WeatherRepositoryImpl: WeatherRepository {

    func get(for location: CLLocationCoordinate2D, at date: Date) async throws -> Weather {
        Weather.mockRandom
    }
}
