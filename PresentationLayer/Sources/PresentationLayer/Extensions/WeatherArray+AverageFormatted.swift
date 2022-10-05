//
//  WeatherArray+AverageFormatted.swift
//  
//
//  Created by Lukas Ruzicka on 15.10.2022.
//

import DomainLayer
import Foundation

extension Array where Element == Weather {

    private var temperatureUnit: UnitTemperature { .init(forLocale: .current) }

    var averageTemperature: Double {
        map {
            $0.temperature.converted(to: temperatureUnit).value
        }
            .average
            .rounded()
    }

    var averageTemperatureFormatted: String {
        Measurement<UnitTemperature>(value: averageTemperature, unit: temperatureUnit).formatted()
    }

    private var windSpeedUnit: UnitSpeed { .init(forLocale: .current) }

    var averageWindSpeed: Double {
        map { $0.wind.speed.converted(to: windSpeedUnit).value }
            .average
            .rounded()
    }

    var averageWindSpeedFormatted: String {
        Measurement<UnitSpeed>(value: averageWindSpeed, unit: windSpeedUnit).formatted()
    }

    private var rainAmountUnit: UnitLength { .init(forLocale: .current) }

    var averageRainAmount: Double {
        map { $0.rain.amount.converted(to: rainAmountUnit).value }
            .average
            .rounded(to: 1)
    }

    var averageRainAmountFormatted: String {
        Measurement<UnitLength>(value: averageRainAmount, unit: rainAmountUnit).formatted()
    }
}
