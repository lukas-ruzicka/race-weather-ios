//
//  Formula1EventsRepositoryImpl.swift
//
//
//  Created by Lukáš Růžička on 03.08.2022.
//

import DomainLayer

final actor MotoGPEventsRepositoryImpl {}

// MARK: - Protocol conformance
extension MotoGPEventsRepositoryImpl: EventsRepository {

    func getAll() async throws -> [Event] {
        Event.mockMotoGPEvents
    }

    func getComing() async throws -> Event {
        Event.mockMotoGPEvents.last!
    }
}
