//
//  Weather+Presentation.swift
//  
//
//  Created by Lukas Ruzicka on 29.10.2022.
//

import DomainLayer
import Foundation

extension Weather {

    var temperatureRoundedFormatted: String {
        let unit = UnitTemperature(forLocale: .current)
        let roundedValue = temperature.converted(to: unit).value.rounded()
        return Measurement<UnitTemperature>(value: roundedValue, unit: unit).formatted()
    }

    var rainAmountRoundedFormatted: String {
        let unit = UnitLength(forLocale: .current)
        let roundedValue = rain.amount.converted(to: unit).value.rounded(to: 1)
        return Measurement<UnitLength>(value: roundedValue, unit: unit).formatted()
    }
}
