//
//  Weather.swift
//  
//
//  Created by Lukáš Růžička on 30.07.2022.
//

import Foundation

public struct Weather: Hashable {

    public let type: WeatherType
    public let temperature: Measurement<UnitTemperature>
    public let humidity: Double?
    public let cloudCover: Double?
    public let rain: Rain
    public let wind: Wind
    public let sfSymbolName: String?

    public init(type: WeatherType, temperature: Measurement<UnitTemperature>, humidity: Double?,
                cloudCover: Double?, rain: Rain, wind: Wind, sfSymbolName: String?) {
        self.type = type
        self.temperature = temperature
        self.humidity = humidity
        self.cloudCover = cloudCover
        self.rain = rain
        self.wind = wind
        self.sfSymbolName = sfSymbolName
    }
}
