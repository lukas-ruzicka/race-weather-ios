//
//  Forecast.swift
//  
//
//  Created by Lukas Ruzicka on 14.08.2022.
//

import Foundation

public struct Forecast: Hashable {

    public let date: Date
    public let weather: Weather
    public let doesPrecedeSession: Bool

    public init(date: Date, weather: Weather, doesPrecedeSession: Bool = false) {
        self.date = date
        self.weather = weather
        self.doesPrecedeSession = doesPrecedeSession
    }
}
