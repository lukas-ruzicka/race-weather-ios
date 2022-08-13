//
//  EventDetailView.swift
//  
//
//  Created by Lukáš Růžička on 13.08.2022.
//

import SwiftUI
import Utils

public struct EventDetailView: View {

    @ObservedObject var viewModel: EventDetailViewModel

    public var body: some View {
        List {
            Section("Sessions") {
                ForEach(viewModel.event.sessions, id: \.self) { session in
                    NavigationLink {
                        Resolver.resolve(SessionDetailView.self, args: session)
                    } label: {
                        HStack(spacing: 8) {
                            Text(session.name)
                            Spacer()
                            if let weather = session.weather {
                                weather.type.icon
                                Text("\(weather.temperature.formatted())°")
                                Text("\(weather.chanceOfRain.formatted())%")
                                    .padding(.trailing)
                            }
                        }
                        .padding(.vertical, 4)
                    }

                }
            }
        }
        .navigationTitle(viewModel.event.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct EventDetailView_Previews: PreviewProvider {

    static var previews: some View {
        EventDetailView(viewModel: .init(event: .mockFormula1EventWithWeather))
    }
}
