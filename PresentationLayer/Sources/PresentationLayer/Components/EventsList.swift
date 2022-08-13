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

    let events: [Event]
    var showSerieSectionTitle = false

    var body: some View {
        List {
            ForEach(events, id: \.self) { event in
                Section(showSerieSectionTitle ? event.serie.name : "") {
                    NavigationLink {
                        Resolver.resolve(EventDetailView.self, args: event)
                    } label: {
                        EventOverview(event: event)
                    }
                }
            }
        }
    }
}

struct EventsList_Previews: PreviewProvider {

    static var previews: some View {
        EventsList(events: Event.mockFormula1Events)
    }
}
