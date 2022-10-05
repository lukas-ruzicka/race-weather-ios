//
//  GetWeatherForEvent.swift
//  
//
//  Created by Lukas Ruzicka on 14.08.2022.
//

import Utils

public protocol GetForecastForEvent {

    func use(event: Event) async throws -> EventWithForecast?
}

final class GetForecastForEventImpl {

    // MARK: - Properties
    @Injected private var weatherRepository: WeatherRepository
    @Injected private var getSessionDetailsForEvent: GetSessionDetailsForEvent
}

// MARK: - Protocol conformance
extension GetForecastForEventImpl: GetForecastForEvent {

    func use(event: Event) async throws -> EventWithForecast? {
        let detailLevel = try await weatherRepository.getAvailableDetailLevel(for: event.location, at: event.start...event.end)

        switch detailLevel {
        case .detailed, .hourly:
            let sessionDetails = try await getSessionDetailsForEvent.use(event: event)
            return .init(event: event, dailyForecast: nil, sessionDetails: sessionDetails)
        case .daily:
            let dailyForecast = try await weatherRepository.getDailyForecast(for: event.location, at: event.start...event.end)
            return .init(event: event, dailyForecast: dailyForecast, sessionDetails: nil)
        default:
            return nil
        }
    }
}
