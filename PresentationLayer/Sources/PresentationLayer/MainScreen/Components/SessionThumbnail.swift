//
//  SessionThumbnail.swift
//
//
//  Created by Lukáš Růžička on 03.08.2022.
//

import DomainLayer
import SwiftUI

struct SessionThumbnail: View {

    let session: Session

    var body: some View {
        switch session.type {
        case .practice:
            HStack {
                Text(session.name)
                session.weather?.type.icon
            }
        case .qualifying, .race:
            HStack(spacing: 32) {
                VStack {
                    Text(session.name)
                    session.weather?.type.icon
                }
                if let weather = session.weather {
                    VStack {
                        Text("\(weather.temperature.formatted())°")
                        Text("\(weather.chanceOfRain.formatted())%")
                    }
                }
            }
        }
    }
}

struct SessionThumbnail_Previews: PreviewProvider {

    @ViewBuilder
    static var previews: some View {
        VStack(spacing: 24) {
            SessionThumbnail(session: .mockFP1)
            SessionThumbnail(session: .mockQualifying)
            SessionThumbnail(session: .mockRace)
        }
    }
}
