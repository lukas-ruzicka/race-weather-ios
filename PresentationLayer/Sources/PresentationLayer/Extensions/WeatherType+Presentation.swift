//
//  WeatherType+Presentation.swift
//  
//
//  Created by Lukas Ruzicka on 03.08.2022.
//

import DomainLayer
import SwiftUI

extension WeatherType {

    @ViewBuilder
    var icon: some View {
        switch self {
        case .clear:
            SFSymbol.sun
        case .overcast:
            SFSymbol.cloudSun
        case .cloudy:
            SFSymbol.cloud
        case .drizzle:
            SFSymbol.drizzle
        case .rain:
            SFSymbol.rain
        case .heavyRain:
            SFSymbol.heavyRain
        case .other:
            SFSymbol.unknown
        }
    }
}
