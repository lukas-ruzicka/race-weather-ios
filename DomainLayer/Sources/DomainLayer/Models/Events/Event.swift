//
//  Event.swift
//  
//
//  Created by Lukáš Růžička on 30.07.2022.
//

import CoreLocation

public struct Event: Hashable {

    public let serie: Serie
    public let id: String
    public let name: String
    public let countryCode: String
    public let trackName: String
    public let location: CLLocation
    public let sessions: [Session]

    public init(serie: Serie, id: String, name: String, countryCode: String,
                trackName: String, location: CLLocation, sessions: [Session]) {
        self.serie = serie
        self.id = id
        self.name = name
        self.countryCode = countryCode
        self.trackName = trackName
        self.location = location
        self.sessions = sessions
    }
}

// MARK: - Computed properties
public extension Event {

    var start: Date {
        sessions.map(\.dateRange.lowerBound).min()!
    }

    var end: Date {
        sessions.map(\.dateRange.upperBound).max()!
    }
}
