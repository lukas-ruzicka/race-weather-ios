//
//  File.swift
//  
//
//  Created by Lukáš Růžička on 03.08.2022.
//

import Utils

public protocol GetComingSessions {

    func use() async throws -> [Event]
}

final class GetComingSessionsImpl {

    // MARK: - Properties
    @Injected private var seriesRepository: SeriesRepository
    @Injected private var weatherRepository: WeatherRepository
}

// MARK: - Protocol conformance
extension GetComingSessionsImpl: GetComingSessions {

    func use() async throws -> [Event] {
        var comingEvents: [Event] = []
        for eventsRepository in eventsRepositories {
            let event = try await eventsRepository.getComing()
            // TODO: - Extract the following logic to another use case
            var sessionsWithWeather: [Session] = []
            for session in event.sessions {
                let weather = try await weatherRepository.get(for: event.location, at: session.start)
                sessionsWithWeather.append(.init(name: session.name, type: session.type, start: session.start, end: session.end, weather: weather))
            }
            comingEvents.append(.init(serie: event.serie, id: event.id, name: event.name, location: event.location, sessions: sessionsWithWeather))
        }
        return comingEvents
    }
}

// MARK: - Supporting functions
private extension GetComingSessionsImpl {

    var eventsRepositories: [EventsRepository] {
        seriesRepository.getAvailable().map { Resolver.resolve(args: $0) }
    }
}
