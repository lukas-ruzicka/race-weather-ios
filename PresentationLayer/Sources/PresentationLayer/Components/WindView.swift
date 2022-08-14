//
//  WindView.swift
//  
//
//  Created by Lukáš Růžička on 14.08.2022.
//

import DomainLayer
import SwiftUI

struct WindView: View {

    let wind: Wind

    var body: some View {
        VStack(spacing: 4) {
            ZStack {
                SFSymbol.arrowUp.body
                    .resizable()
                    .frame(width: 12, height: 32)
                    .foregroundColor(.cyan)
                    .rotationEffect(.degrees(wind.direction.converted(to: .degrees).value))
                Text(wind.speed.formatted())
                    .font(.footnote)
            }
            if let gust = wind.gust {
                Text("Gust: \(gust.formatted())")
                    .font(.footnote)
            }
        }
    }
}

struct WindView_Previews: PreviewProvider {

    @ViewBuilder
    static var previews: some View {
        VStack(spacing: 24) {
            WindView(wind: .mockSlow)
            WindView(wind: .mockFast)
            WindView(wind: .mockGusty)
        }
    }
}
