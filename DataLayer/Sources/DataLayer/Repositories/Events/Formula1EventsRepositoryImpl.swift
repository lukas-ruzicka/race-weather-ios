//
//  Formula1EventsRepositoryImpl.swift
//  
//
//  Created by Lukas Ruzicka on 03.08.2022.
//

import DomainLayer
import Foundation
import Utils

final actor Formula1EventsRepositoryImpl {

    // MARK: - Subtypes
    enum Failure: Error {

        case noComingRace
    }

    // MARK: - Properties
    @Injected private var networking: Networking
    @Injected private var runtimeCache: RuntimeCache
}

// MARK: - Protocol conformance
extension Formula1EventsRepositoryImpl: EventsRepository {

    func getAll() async throws -> [Event] {
        if let cachedEvents: [Event] = runtimeCache.get(.formula1Events) {
            return cachedEvents
        }
        let response: ErgastEventResponseModel = try await networking.request(ErgastRequestSpec.getFormula1ThisYearsEvents)
        let events: [Event] = .init(from: response, serie: .formula1)
            .filter { $0.end > Date() }
        runtimeCache.cache(events, for: .formula1Events, validity: 60 * 60)
        return events
    }

    func getComing() async throws -> Event {
        guard let comingEvent = try await getAll().first else { throw Failure.noComingRace }
        return comingEvent
    }
}
