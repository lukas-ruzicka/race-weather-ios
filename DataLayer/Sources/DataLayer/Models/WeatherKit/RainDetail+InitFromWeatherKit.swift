//
//  RainDetail+InitFromWeatherKit.swift
//  
//
//  Created by Lukas Ruzicka on 29.10.2022.
//

import DomainLayer
import WeatherKit

extension RainDetail {

    init(from minuteWeather: MinuteWeather) {
        self.init(date: minuteWeather.date,
                  chance: minuteWeather.precipitationChance,
                  intensity: minuteWeather.precipitationIntensity)
    }
}
