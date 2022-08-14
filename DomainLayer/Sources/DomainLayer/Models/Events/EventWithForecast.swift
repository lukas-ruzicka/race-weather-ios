//
//  EventWithForecast.swift
//  
//
//  Created by Lukáš Růžička on 14.08.2022.
//

public struct EventWithForecast: Hashable {

    public let event: Event
    public let dailyForecast: [Forecast]?
    public let sessionDetails: [SessionDetail]?

    public init(event: Event, dailyForecast: [Forecast]?, sessionDetails: [SessionDetail]?) {
        self.event = event
        self.dailyForecast = dailyForecast
        self.sessionDetails = sessionDetails
    }
}
