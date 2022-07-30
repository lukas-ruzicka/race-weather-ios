//
//  Event.swift
//  
//
//  Created by Lukáš Růžička on 30.07.2022.
//

import CoreLocation

struct Event {

    let id: String
    let name: String
    let location: CLLocationCoordinate2D
    let sessions: [Session]
}

// MARK: - Equatable
extension Event: Equatable {

    static func == (lhs: Event, rhs: Event) -> Bool {
        lhs.id == rhs.id
    }
}

// MARK: - Hashable
extension Event: Hashable {

    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
