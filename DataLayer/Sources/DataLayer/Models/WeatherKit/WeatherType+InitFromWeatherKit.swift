//
//  WeatherType+InitFromWeatherKit.swift
//  
//
//  Created by Lukas Ruzicka on 29.10.2022.
//

import DomainLayer
import WeatherKit

extension WeatherType {

    init(from condition: WeatherCondition) {
        switch condition {
        case .clear:
            self = .clear
        case .mostlyClear, .mostlyCloudy, .partlyCloudy:
            self = .overcast
        case .cloudy:
            self = .cloudy
        case .drizzle:
            self = .drizzle
        case .isolatedThunderstorms, .rain, .sunShowers:
            self = .rain
        case .heavyRain, .scatteredThunderstorms, .strongStorms, .thunderstorms:
            self = .heavyRain
        default:
            self = .other
        }
    }
}
