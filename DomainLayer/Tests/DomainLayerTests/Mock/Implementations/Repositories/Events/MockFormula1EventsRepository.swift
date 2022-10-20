//
//  MockFormula1EventsRepository.swift
//  
//
//  Created by Lukas Ruzicka on 20.10.2022.
//

import DomainLayer

final class MockFormula1EventsRepository {}

// MARK: - Protocol conformance
extension MockFormula1EventsRepository: EventsRepository {

    func getAll() async throws -> [Event] {
        Event.mockFormula1Events
    }

    func getComing() async throws -> Event {
        Event.mockFormula1Events.first!
    }
}
