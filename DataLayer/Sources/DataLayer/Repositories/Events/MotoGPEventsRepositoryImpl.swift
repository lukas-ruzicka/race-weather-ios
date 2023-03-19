//
//  Formula1EventsRepositoryImpl.swift
//
//
//  Created by Lukas Ruzicka on 03.08.2022.
//

import DomainLayer
import Foundation
import Utils

final actor MotoGPEventsRepositoryImpl {

    // MARK: - Subtypes
    enum Failure: Error {

        case eventDecodingFailed
        case noComingRace
    }

    // MARK: - Properties
    @Injected private var networking: Networking
    @Injected private var runtimeCache: RuntimeCache
}

// MARK: - Protocol conformance
extension MotoGPEventsRepositoryImpl: EventsRepository {

    func getAll() async throws -> [Event] {
        if let cachedEvents: [Event] = runtimeCache.get(.motogpEvents) {
            return cachedEvents
        }
        var events: [Event] = []
        for eventName in try await fetchComingEventNames() {
            events.append(try await fetchEvent(for: eventName))
        }
        runtimeCache.cache(events, for: .motogpEvents, validity: 60 * 60)
        runtimeCache.clear(.motogpComingEvent)
        return events
    }

    func getComing() async throws -> Event {
        if let cachedComingEvent: Event = runtimeCache.get(.motogpComingEvent) {
            return cachedComingEvent
        }
        if let cachedEvents: [Event] = runtimeCache.get(.motogpEvents) {
            guard let comingEvent = cachedEvents.first else { throw Failure.noComingRace }
            return comingEvent
        }
        guard let comingEventName = (try await fetchComingEventNames()).first else { throw Failure.noComingRace }
        let comingEvent = try await fetchEvent(for: comingEventName)
        runtimeCache.cache(comingEvent, for: .motogpComingEvent, validity: 60 * 60)
        return comingEvent
    }
}

// MARK: - Supporting functions
private extension MotoGPEventsRepositoryImpl {

    func fetchComingEventNames() async throws -> [String] {
        let response: MotoTimingEventOverviewResponseModel = try await networking
            .request(MotoTimingRequestSpec.getMotogpThisYearsEvents)
        let currentDate = Date()
        return response.calendar
            .filter { $0.test == 0 }
            .filter { Date(string: $0.end_date)?.addingTimeInterval(24 * 60 * 60) ?? currentDate > currentDate }
            .sorted(by: { Date(string: $0.start_date) ?? currentDate < Date(string: $1.start_date) ?? currentDate })
            .map(\.name)
    }

    func fetchEvent(for eventName: String) async throws -> Event {
        let eventResponse: MotoTimingEventResponseModel = try await networking
            .request(MotoTimingRequestSpec.getMotogpEventDetail(eventName))
        guard let event = Event(from: eventResponse, serie: .motogp) else { throw Failure.eventDecodingFailed }
        return event
    }
}
