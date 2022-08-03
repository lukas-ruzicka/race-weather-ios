//
//  Event.swift
//  
//
//  Created by Lukáš Růžička on 30.07.2022.
//

import CoreLocation

public struct Event {

    public let serie: Serie
    public let id: String
    public let name: String
    public let location: CLLocationCoordinate2D
    public let sessions: [Session]

    public init(serie: Serie, id: String, name: String, location: CLLocationCoordinate2D, sessions: [Session]) {
        self.serie = serie
        self.id = id
        self.name = name
        self.location = location
        self.sessions = sessions
    }
}

// MARK: - Equatable
extension Event: Equatable {

    public static func == (lhs: Event, rhs: Event) -> Bool {
        lhs.serie == rhs.serie && lhs.id == rhs.id
    }
}

// MARK: - Hashable
extension Event: Hashable {

    public func hash(into hasher: inout Hasher) {
        hasher.combine(serie)
        hasher.combine(id)
    }
}
