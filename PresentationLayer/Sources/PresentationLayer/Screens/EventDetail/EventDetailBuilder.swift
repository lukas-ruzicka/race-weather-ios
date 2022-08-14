//
//  EventDetailBuilder.swift
//  
//
//  Created by Lukáš Růžička on 13.08.2022.
//

import DomainLayer

public enum EventDetailBuilder {

    public static func build(eventWithForecast: EventWithForecast) -> EventDetailView {
        let viewModel = EventDetailViewModel(eventWithForecast: eventWithForecast)
        return .init(viewModel: viewModel)
    }
}
