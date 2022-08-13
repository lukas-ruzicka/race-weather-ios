//
//  EventDetailBuilder.swift
//  
//
//  Created by Lukáš Růžička on 13.08.2022.
//

import DomainLayer

public enum EventDetailBuilder {

    public static func build(event: Event) -> EventDetailView {
        let viewModel = EventDetailViewModel(event: event)
        return .init(viewModel: viewModel)
    }
}
