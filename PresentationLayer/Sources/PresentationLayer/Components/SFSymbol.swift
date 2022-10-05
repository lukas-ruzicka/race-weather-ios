//
//  SFSymbol.swift
//  
//
//  Created by Lukas Ruzicka on 03.08.2022.
//

import SwiftUI

public enum SFSymbol: String, CaseIterable, View {

    // Weather
    case sun = "sun.max"
    case cloudSun = "cloud.sun"
    case cloud
    case drizzle = "cloud.drizzle"
    case rain = "cloud.rain"
    case heavyRain = "cloud.heavyrain"

    // Other
    case stopwatch
    case list = "list.bullet"
    case locationNorth = "location.north"
    case locationNorthCircle = "location.north.circle"
    case chequeredFlag = "checkerboard.rectangle"
    case unknown = "questionmark.app.dashed"
    case gear

    public var body: Image {
        Image(systemName: rawValue)
    }
}

struct SFSymbol_Previews: PreviewProvider {

    static var previews: some View {
        ForEach(SFSymbol.allCases, id: \.self) {
            $0
        }
    }
}
