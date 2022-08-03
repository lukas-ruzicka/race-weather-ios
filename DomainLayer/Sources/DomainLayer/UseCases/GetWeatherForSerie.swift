//
//  GetWeatherForSerie.swift
//  
//
//  Created by Lukáš Růžička on 30.07.2022.
//

import Utils

protocol GetWeatherForSerie {

    func use() async throws -> [Event]
}

final class GetWeatherForSerieImpl {

    // MARK: - Properties
    @Injected private var weatherRepository: WeatherRepository
    private let eventsRepository: EventsRepository

    // MARK: - Init
    init(serie: Serie) {
        eventsRepository = Resolver.resolve(args: serie)
    }
}

// MARK: - Protocol conformance
extension GetWeatherForSerieImpl: GetWeatherForSerie {

    func use() async throws -> [Event] {
        let events = try await eventsRepository.getAll()
        var eventsWithWeather: [Event] = []
        for event in events {
            var sessionsWithWeather: [Session] = []
            for session in event.sessions {
                let weather = try await weatherRepository.get(for: event.location, at: session.start)
                sessionsWithWeather.append(.init(name: session.name, type: session.type, start: session.start, end: session.end, weather: weather))
            }
            eventsWithWeather.append(.init(serie: event.serie,id: event.id, name: event.name, location: event.location, sessions: sessionsWithWeather))
        }
        return eventsWithWeather
    }
}
