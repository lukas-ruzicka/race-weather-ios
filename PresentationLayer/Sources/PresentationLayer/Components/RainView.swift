//
//  RainView.swift
//  
//
//  Created by Lukáš Růžička on 14.08.2022.
//

import DomainLayer
import SwiftUI

struct RainView: View {

    let rain: Rain

    var body: some View {
        VStack(spacing: 4) {
            Text(rain.amount.formatted())
            Text("\((rain.chance * 100).formatted())%")
        }
        .font(.footnote)
    }
}

struct RainView_Previews: PreviewProvider {

    @ViewBuilder
    static var previews: some View {
        VStack(spacing: 24) {
            RainView(rain: .mockNoRain)
            RainView(rain: .mockLittleRain)
            RainView(rain: .mockHeavyRain)
        }
    }
}
