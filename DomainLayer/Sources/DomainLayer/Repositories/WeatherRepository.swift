//
//  WeatherRepository.swift
//  
//
//  Created by Lukáš Růžička on 30.07.2022.
//

import CoreLocation
import Foundation

protocol WeatherRepository {

    func get(for location: CLLocationCoordinate2D, at date: Date) async throws -> Weather
}
