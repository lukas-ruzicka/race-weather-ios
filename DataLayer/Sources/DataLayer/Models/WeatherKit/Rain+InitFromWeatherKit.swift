//
//  Rain+InitFromWeatherKit.swift
//  
//
//  Created by Lukas Ruzicka on 29.10.2022.
//

import DomainLayer
import WeatherKit

extension Rain {

    init(from dayWeather: DayWeather) {
        self.init(chance: dayWeather.precipitationChance,
                  amount: dayWeather.rainfallAmount)
    }

    init(from hourWeather: HourWeather) {
        self.init(chance: hourWeather.precipitationChance,
                  amount: hourWeather.precipitationAmount)
    }
}
