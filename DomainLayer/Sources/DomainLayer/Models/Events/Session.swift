//
//  Session.swift
//  
//
//  Created by Lukáš Růžička on 30.07.2022.
//

import Foundation

public struct Session: Hashable {

    public let id: String
    public let name: String
    public let dateRange: ClosedRange<Date>

    public init(id: String, name: String, dateRange: ClosedRange<Date>) {
        self.id = id
        self.name = name
        self.dateRange = dateRange
    }
}

// MARK: - Computed properties
public extension Session {

    var isFinished: Bool {
        dateRange.upperBound < Date()
    }
}
