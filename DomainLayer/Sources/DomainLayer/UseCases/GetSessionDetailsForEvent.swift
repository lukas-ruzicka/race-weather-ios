//
//  GetSessionDetailsForEvent.swift
//  
//
//  Created by Lukáš Růžička on 14.08.2022.
//

import Foundation
import Utils

public protocol GetSessionDetailsForEvent {

    func use(event: Event) async throws -> [SessionDetail]
}

final class GetSessionDetailsForEventImpl {

    // MARK: - Properties
    @Injected private var weatherRepository: WeatherRepository
}

// MARK: - Protocol conformance
extension GetSessionDetailsForEventImpl: GetSessionDetailsForEvent {

    func use(event: Event) async throws -> [SessionDetail] {
        var sessionDetails: [SessionDetail] = []
        for session in event.sessions {
            var forecast: [Forecast]? = nil
            if !session.isFinished {
                forecast = try? await weatherRepository.getHourlyForecast(for: event.location, at: session.dateRange)
            }
            sessionDetails.append(.init(from: event, session: session, forecast: forecast))
        }
        return sessionDetails
    }
}
