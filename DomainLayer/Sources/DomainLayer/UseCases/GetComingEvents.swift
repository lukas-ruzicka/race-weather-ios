//
//  GetComingEvents.swift
//  
//
//  Created by Lukas Ruzicka on 03.08.2022.
//

import Utils

public protocol GetComingEvents {

    func use() async throws -> [Event]
}

final class GetComingEventsImpl {

    // MARK: - Properties
    @Injected private var seriesRepository: SeriesRepository
}

// MARK: - Protocol conformance
extension GetComingEventsImpl: GetComingEvents {

    func use() async throws -> [Event] {
        var comingEvents: [Event] = []
        for eventsRepository in eventsRepositories {
            if let event = try? await eventsRepository.getComing() {
                comingEvents.append(event)
            }
        }
        return comingEvents
    }
}

// MARK: - Supporting functions
private extension GetComingEventsImpl {

    var eventsRepositories: [EventsRepository] {
        seriesRepository.getAvailable().map { Resolver.resolve(args: $0) }
    }
}
