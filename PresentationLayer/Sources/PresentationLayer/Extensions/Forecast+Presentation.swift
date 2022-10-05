//
//  Forecast+Presentation.swift
//  
//
//  Created by Lukas Ruzicka on 14.08.2022.
//

import DomainLayer
import SwiftUI

extension Forecast {

    @ViewBuilder
    var icon: some View {
        weatherIcon
            .opacity(doesPrecedeSession ? 0.2 : 1)
    }

    @ViewBuilder
    private var weatherIcon: some View {
        if let sfSymbolName = weather.sfSymbolName {
            Image(systemName: sfSymbolName)
        } else {
            weather.type.icon
        }
    }
}
