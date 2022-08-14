//
//  Forecast.swift
//  
//
//  Created by Lukáš Růžička on 14.08.2022.
//

import Foundation

public struct Forecast: Hashable {

    public let date: Date
    public let weather: Weather

    public init(date: Date, weather: Weather) {
        self.date = date
        self.weather = weather
    }
}
