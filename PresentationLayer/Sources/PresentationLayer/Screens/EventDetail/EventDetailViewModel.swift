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
    let eventWithForecast: EventWithForecast

    // MARK: - Init
    init(eventWithForecast: EventWithForecast) {
        self.eventWithForecast = eventWithForecast
    }

    // MARK: - Interactions
    func getSessionDetail(for session: Session) -> SessionDetail {
        eventWithForecast.sessionDetails?.first(where: { $0.id == session.id }) ?? .init(from: eventWithForecast, session: session)
    }
}
