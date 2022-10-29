//
//  Wind+InitFromWeatherKit.swift
//  
//
//  Created by Lukas Ruzicka on 29.10.2022.
//

import DomainLayer
import WeatherKit

extension DomainLayer.Wind {

    init(from wind: WeatherKit.Wind) {
        self.init(direction: wind.direction,
                  speed: wind.speed,
                  gust: wind.gust)
    }
}
