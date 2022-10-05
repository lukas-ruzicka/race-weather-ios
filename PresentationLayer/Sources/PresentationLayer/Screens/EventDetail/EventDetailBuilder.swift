//
//  EventDetailBuilder.swift
//  
//
//  Created by Lukas Ruzicka on 13.08.2022.
//

import DomainLayer

public enum EventDetailBuilder {

    @MainActor
    public static func build(event: Event) -> EventDetailView {
        let viewModel = EventDetailViewModel(event: event)
        return .init(viewModel: viewModel)
    }
}
