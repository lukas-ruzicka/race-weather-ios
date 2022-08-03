//
//  Session.swift
//  
//
//  Created by Lukáš Růžička on 30.07.2022.
//

import Foundation

public struct Session {

    public let name: String
    public let type: SessionType
    public let start: Date
    public let end: Date
    public let weather: Weather?

    public init(name: String, type: SessionType, start: Date, end: Date, weather: Weather?) {
        self.name = name
        self.type = type
        self.start = start
        self.end = end
        self.weather = weather
    }
}

// MARK: - Equatable
extension Session: Equatable {

    public static func == (lhs: Session, rhs: Session) -> Bool {
        lhs.name == rhs.name // TODO: ?
    }
}

// MARK: - Hashable
extension Session: Hashable {

    public func hash(into hasher: inout Hasher) {
        hasher.combine(name) // TODO: ?
    }
}
