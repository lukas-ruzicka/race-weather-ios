//
//  Weather+InitFromWeatherKit.swift
//  
//
//  Created by Lukas Ruzicka on 29.10.2022.
//

import DomainLayer
import WeatherKit

extension DomainLayer.Weather {

    init(from dayWeather: DayWeather) {
        self.init(type: .init(from: dayWeather.condition),
                  temperature: dayWeather.highTemperature,
                  humidity: nil,
                  cloudCover: nil,
                  rain: .init(from: dayWeather),
                  wind: .init(from: dayWeather.wind),
                  sfSymbolName: dayWeather.symbolName
        )
    }

    init(from hourWeather: HourWeather) {
        self.init(type: .init(from: hourWeather.condition),
                  temperature: hourWeather.temperature,
                  humidity: hourWeather.humidity,
                  cloudCover: hourWeather.cloudCover,
                  rain: .init(from: hourWeather),
                  wind: .init(from: hourWeather.wind),
                  sfSymbolName: hourWeather.symbolName
        )
    }
}
