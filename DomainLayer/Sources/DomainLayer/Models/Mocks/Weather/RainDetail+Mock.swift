//
//  RainDetail+Mock.swift
//  
//
//  Created by Lukas Ruzicka on 14.08.2022.
//

import Foundation

public extension RainDetail {

    static func mock(for range: ClosedRange<Date>) -> [RainDetail] {
        var minutes: [RainDetail] = []
        var currentMinuteDate = range.lowerBound
        repeat {
            minutes.append(.init(date: currentMinuteDate,
                                 chance: Double(Int.random(in: 0...10)) / 10,
                                 intensity: .init(value: Double(Int.random(in: 0...40)), unit: .kilometersPerHour)))
            currentMinuteDate = currentMinuteDate.addingTimeInterval(60)
        } while currentMinuteDate < range.upperBound
        return minutes
    }

    static var mock: [RainDetail] {
        mock(for: Date()...Date().addingTimeInterval(60 * 60))
    }
}
