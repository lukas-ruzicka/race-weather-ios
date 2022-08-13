//
//  WeatherType+Presentation.swift
//  
//
//  Created by Lukáš Růžička on 03.08.2022.
//

import DomainLayer
import SwiftUI

extension WeatherType {

    @ViewBuilder
    var icon: some View {
        switch self {
        case .sunny:
            SFSymbol.sun
        case .overcast:
            SFSymbol.cloudSun
        case .cloudy:
            SFSymbol.cloud
        case .raining:
            SFSymbol.rain
        }
    }
}
