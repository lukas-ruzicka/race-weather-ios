//
//  Weather.swift
//  
//
//  Created by Lukáš Růžička on 30.07.2022.
//

import Foundation

public struct Weather {

    public let type: WeatherType
    public let temperature: Double
    public let chanceOfRain: Double

    public init(type: WeatherType, temperature: Double, chanceOfRain: Double) {
        self.type = type
        self.temperature = temperature
        self.chanceOfRain = chanceOfRain
    }
}
