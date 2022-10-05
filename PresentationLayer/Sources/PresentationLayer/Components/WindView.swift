//
//  WindView.swift
//  
//
//  Created by Lukas Ruzicka on 14.08.2022.
//

import DomainLayer
import SwiftUI

struct WindView: View {

    // MARK: - Properties
    let wind: Wind
    var event: Event?

    @State private var direction: Angle = .zero

    // MARK: - Body
    var body: some View {
        VStack(spacing: 8) {
            ZStack {
                if event?.trackMapUrl != nil {
                    event?.trackMapImage(size: 40)
                    SFSymbol.locationNorth.body
                        .resizable()
                        .frame(width: 32, height: 40)
                        .foregroundColor(.windDirection)
                        .opacity(0.9)
                        .shadow(color: .shadow, radius: 2)
                        .rotationEffect(direction)
                } else {
                    SFSymbol.locationNorthCircle.body
                        .resizable()
                        .frame(size: 40)
                        .foregroundColor(.windDirection)
                        .rotationEffect(direction)
                }
            }
            .animation(.interpolatingSpring(stiffness: 100, damping: 8, initialVelocity: 0)
                .delay(0.2),
                       value: direction)
            Text(wind.speed.formatted())
            if let gust = wind.gust {
                VStack(spacing: 0) {
                    L10n.WeatherProperty.gust
                        .foregroundColor(.Text.secondary)
                    Text(gust.formatted())
                }
                .font(.footnote)
            }
        }
        .font(.footnote)
        .onAppear {
            direction = .degrees(wind.direction.converted(to: .degrees).value)
        }
    }
}

// MARK: - Preview
struct WindView_Previews: PreviewProvider {

    @ViewBuilder
    static var previews: some View {
        VStack(spacing: 24) {
            WindView(wind: .mockSlow, event: Event.mockFormula1BelgianGP)
            WindView(wind: .mockFast, event: Event.mockFormula1DutchGP)
            WindView(wind: .mockGusty, event: Event.mockMotoGPCzechGP)
            WindView(wind: .mockRandom)
        }
    }
}
