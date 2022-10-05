//
//  Session.swift
//  
//
//  Created by Lukas Ruzicka on 30.07.2022.
//

import Foundation

public struct Session: Hashable {

    public let id: String
    public let type: SessionType
    public let dateRange: ClosedRange<Date>

    public init(id: String, type: SessionType, dateRange: ClosedRange<Date>) {
        self.id = id
        self.type = type
        self.dateRange = dateRange
    }
}

// MARK: - Computed properties
public extension Session {

    var hasntStartedYet: Bool {
        dateRange.lowerBound > Date()
    }

    var isLive: Bool {
        let currentDate = Date()
        return currentDate > dateRange.lowerBound && currentDate < dateRange.upperBound
    }

    var isFinished: Bool {
        dateRange.upperBound < Date()
    }
}
