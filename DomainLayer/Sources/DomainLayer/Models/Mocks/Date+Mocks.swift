//
//  Date+Mocks.swift
//  
//
//  Created by Lukas Ruzicka on 20.10.2022.
//

import Foundation

extension Date {

    enum Weekday: Int {
        
        case sunday = 1
        case monday
        case tuesday
        case wednesday
        case thursday
        case friday
        case saturday
    }

    private static var calendar: Calendar {
        var calendar = Calendar(identifier: .gregorian)
        calendar.firstWeekday = 2
        return calendar
    }

    static func thisWeeks(_ weekday: Weekday, at hour: Int) -> Date {
        next(weekday, at: hour, after: startOfTheWeek)
    }

    static func nextWeeks(_ weekday: Weekday, at hour: Int) -> Date {
        next(weekday, at: hour, after: calendar.date(byAdding: .day, value: 7, to: startOfTheWeek)!)
    }

    private static func next(_ weekday: Weekday, at hour: Int, after afterDate: Date = .now) -> Date {
        calendar.nextDate(after: afterDate, matching: .init(hour: hour, weekday: weekday.rawValue),
                          matchingPolicy: .nextTimePreservingSmallerComponents)!
    }

    private static var startOfTheWeek: Date {
        let startOfNextWeek = calendar.nextDate(after: .now, matching: .init(weekday: calendar.firstWeekday),
                                                matchingPolicy: .previousTimePreservingSmallerComponents)!
        return calendar.date(byAdding: .day, value: -7, to: startOfNextWeek)!
    }
}
