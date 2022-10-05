//
//  Formula1EventsRepositoryImpl.swift
//  
//
//  Created by Lukas Ruzicka on 03.08.2022.
//

import DomainLayer

final class Formula1EventsRepositoryImpl {}

// MARK: - Protocol conformance
extension Formula1EventsRepositoryImpl: EventsRepository {

    func getAll() async throws -> [Event] {
        try await Task.sleep(nanoseconds: 300_000_000)
        return Event.mockFormula1Events
    }

    func getComing() async throws -> Event {
        try await Task.sleep(nanoseconds: 300_000_000)
        return Event.mockFormula1Events.first!
    }
}
