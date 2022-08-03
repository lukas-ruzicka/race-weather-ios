//
//  SFSymbol.swift
//  
//
//  Created by Lukáš Růžička on 03.08.2022.
//

import SwiftUI

enum SFSymbol: String, CaseIterable, View {

    case sun = "sun.max"
    case cloudSun = "cloud.sun"
    case cloud
    case rain = "cloud.rain"

    var body: some View {
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
