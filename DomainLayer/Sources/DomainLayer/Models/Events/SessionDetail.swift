//
//  SessionDetail.swift
//  
//
//  Created by Lukáš Růžička on 14.08.2022.
//

import Foundation

public struct SessionDetail: Hashable {

    public let id: String
    public let event: Event
    public let name: String
    public let dateRange: ClosedRange<Date>
    public let forecast: [Forecast]?

    public init(id: String, event: Event, name: String, dateRange: ClosedRange<Date>, forecast: [Forecast]?) {
        self.id = id
        self.event = event
        self.name = name
        self.dateRange = dateRange
        self.forecast = forecast
    }

    public init(from eventWithForecast: EventWithForecast, session: Session) {
        id = session.id
        event = eventWithForecast.event
        name = session.name
        dateRange = session.dateRange
        forecast = eventWithForecast.dailyForecast?.filter { Calendar.current.isDate($0.date, inSameDayAs: session.dateRange.lowerBound) }
    }

    public init(from event: Event, session: Session, forecast: [Forecast]?) {
        id = session.id
        self.event = event
        name = session.name
        dateRange = session.dateRange
        self.forecast = forecast
    }
}

// MARK: - Computed properties
public extension SessionDetail {

    var isFinished: Bool {
        dateRange.upperBound < Date()
    }
}
