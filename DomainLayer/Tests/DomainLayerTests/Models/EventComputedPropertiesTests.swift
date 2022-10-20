//
//  EventComputedPropertiesTests.swift
//  
//
//  Created by Lukas Ruzicka on 20.10.2022.
//

@testable import DomainLayer
import XCTest

final class EventComputedPropertiesTests: XCTestCase {

    // MARK: - Properties
    private let fridaySession = Session(
        id: "1", type: .practice(number: 1),
        dateRange: .nextWeeks(.friday, at: 10)...Date.nextWeeks(.friday, at: 12)
    )
    private let saturdaySession = Session(
        id: "2", type: .qualifying(),
        dateRange: .nextWeeks(.saturday, at: 15)...Date.nextWeeks(.saturday, at: 19)
    )
    private let sundaySession = Session(
        id: "3", type: .race,
        dateRange: .nextWeeks(.sunday, at: 14)...Date.nextWeeks(.sunday, at: 16)
    )

    // MARK: - Tests
    func testEvent() {
        let event = Event(
            serie: .formula1, id: "", name: "", countryCode: "",
            trackName: "", trackMapUrl: nil, location: .init(),
            sessions: [
                fridaySession, saturdaySession, sundaySession
            ]
        )
        XCTAssertEqual(event.mainDate, .nextWeeks(.sunday, at: 14))
        XCTAssertEqual(event.start, .nextWeeks(.friday, at: 10))
        XCTAssertEqual(event.end, .nextWeeks(.sunday, at: 16))
    }

    func testMixedSessionsEvent() {
        let mixedSessionsEvent = Event(
            serie: .formula1, id: "", name: "", countryCode: "",
            trackName: "", trackMapUrl: nil, location: .init(),
            sessions: [
                sundaySession, fridaySession, saturdaySession
            ]
        )
        XCTAssertEqual(mixedSessionsEvent.mainDate, .nextWeeks(.saturday, at: 15))
        XCTAssertEqual(mixedSessionsEvent.start, .nextWeeks(.friday, at: 10))
        XCTAssertEqual(mixedSessionsEvent.end, .nextWeeks(.sunday, at: 16))
    }
}
