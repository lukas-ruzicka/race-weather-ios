//
//  MockMotoGPEventsRepository.swift
//
//
//  Created by Lukas Ruzicka on 20.10.2022.
//

import DomainLayer

final actor MockMotoGPEventsRepository {}

// MARK: - Protocol conformance
extension MockMotoGPEventsRepository: EventsRepository {

    func getAll() async throws -> [Event] {
        Event.mockMotoGPEvents
    }

    func getComing() async throws -> Event {
        Event.mockMotoGPEvents.last!
    }
}
