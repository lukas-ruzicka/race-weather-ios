//
//  Formula1EventsRepositoryImpl.swift
//  
//
//  Created by Lukáš Růžička on 03.08.2022.
//

import DomainLayer

final class Formula1EventsRepositoryImpl {}

// MARK: - Protocol conformance
extension Formula1EventsRepositoryImpl: EventsRepository {

    func getAll() async throws -> [Event] {
        Event.mockFormula1Events
    }

    func getComing() async throws -> Event {
        Event.mockFormula1Events.first!
    }
}
