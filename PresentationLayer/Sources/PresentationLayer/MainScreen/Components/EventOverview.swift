//
//  EventOverview.swift
//  
//
//  Created by Lukáš Růžička on 03.08.2022.
//

import DomainLayer
import SwiftUI

struct EventOverview: View {

    let event: Event

    private var practices: [Session] {
        event.sessions.filter { $0.type == .practice }
    }
    private var nonPractices: [Session] {
        event.sessions.filter { $0.type != .practice }
    }

    var body: some View {
        VStack(spacing: 16) {
            HStack(alignment: .top) {
                if let date = event.mainDate {
                    Text(date.formatted(date: .abbreviated, time: .omitted))
                }
                Spacer()
                Text(event.name)
                    .font(.title2)
                Spacer()
                Text(event.serie.rawValue)
            }
            Divider()
            Grid {
                if !practices.isEmpty {
                    GridRow {
                        ForEach(practices, id: \.self) {
                            SessionThumbnail(session: $0)
                                .padding(.horizontal, 8)
                        }
                    }
                    Divider()
                        .blur(radius: 1)
                }
                ForEach(nonPractices, id: \.self) {
                    SessionThumbnail(session: $0)
                        .padding(.vertical, 4)
                    if $0.type != .race { // TODO: - This logic is bullshit
                        Divider()
                            .blur(radius: 1)
                    }
                }
            }
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background()
        .cornerRadius(16)
        .shadow(radius: 8)
    }
}

struct EventOverview_Previews: PreviewProvider {

    static var previews: some View {
        EventOverview(event: .mockFormula1EventWithWeather)
            .padding()
    }
}
