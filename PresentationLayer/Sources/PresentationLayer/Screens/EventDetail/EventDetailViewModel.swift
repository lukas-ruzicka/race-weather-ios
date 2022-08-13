//
//  EventDetailViewModel.swift
//  
//
//  Created by Lukáš Růžička on 13.08.2022.
//

import Combine
import DomainLayer
import Utils

final class EventDetailViewModel: ObservableObject {

    // MARK: - Properties
    let event: Event

    // MARK: - Init
    init(event: Event) {
        self.event = event
    }
}
