//
//  EventsList.swift
//  
//
//  Created by Lukáš Růžička on 13.08.2022.
//

import DomainLayer
import SwiftUI
import Utils

struct EventsList: View {

    let eventsWithForecast: [EventWithForecast]
    var showSerieSectionTitle = false

    var body: some View {
        List {
            ForEach(eventsWithForecast, id: \.self) { eventWithForecast in
                Section(showSerieSectionTitle ? eventWithForecast.event.serie.name : "") {
                    NavigationLink {
                        Resolver.resolve(EventDetailView.self, args: eventWithForecast)
                    } label: {
                        EventOverview(eventWithForecast: eventWithForecast)
                    }
                }
            }
        }
        .animation(.default, value: eventsWithForecast)
    }
}

struct EventsList_Previews: PreviewProvider {

    static var previews: some View {
        EventsList(eventsWithForecast: [.mockDetailed, .mockDaily, .mockNoForecast])
    }
}
