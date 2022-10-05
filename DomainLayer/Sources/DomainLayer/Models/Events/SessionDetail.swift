//
//  SessionDetail.swift
//  
//
//  Created by Lukas Ruzicka on 14.08.2022.
//

import Foundation

public struct SessionDetail: Hashable {

    public let id: String
    public let event: Event
    public let type: SessionType
    public let dateRange: ClosedRange<Date>
    public let forecast: [Forecast]?

    public init(id: String, event: Event, type: SessionType, dateRange: ClosedRange<Date>, forecast: [Forecast]?) {
        self.id = id
        self.event = event
        self.type = type
        self.dateRange = dateRange
        self.forecast = forecast
    }

    public init(from eventWithForecast: EventWithForecast, session: Session) {
        id = session.id
        event = eventWithForecast.event
        type = session.type
        dateRange = session.dateRange
        forecast = eventWithForecast.dailyForecast?.filter { Calendar.current.isDate($0.date, inSameDayAs: session.dateRange.lowerBound) }
    }

    public init(from event: Event, session: Session, forecast: [Forecast]?) {
        id = session.id
        self.event = event
        type = session.type
        dateRange = session.dateRange
        self.forecast = forecast
    }
}

// MARK: - Computed properties
public extension SessionDetail {

    var isLive: Bool {
        let currentDate = Date()
        return currentDate > dateRange.lowerBound && currentDate < dateRange.upperBound
    }

    var isFinished: Bool {
        dateRange.upperBound < Date()
    }
}
