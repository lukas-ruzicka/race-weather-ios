//
//  SessionComputedPropertiesTests.swift
//  
//
//  Created by Lukas Ruzicka on 20.10.2022.
//

@testable import DomainLayer
import XCTest

final class SessionComputedPropertiesTests: XCTestCase {

    func testSessionInFuture() {
        let session = Session.inFuture
        XCTAssertTrue(session.hasntStartedYet)
        XCTAssertFalse(session.isLive)
        XCTAssertFalse(session.isFinished)
    }

    func testLiveSession() {
        let session = Session.live
        XCTAssertFalse(session.hasntStartedYet)
        XCTAssertTrue(session.isLive)
        XCTAssertFalse(session.isFinished)
    }

    func testFinishedSession() {
        let session = Session.finished
        XCTAssertFalse(session.hasntStartedYet)
        XCTAssertFalse(session.isLive)
        XCTAssertTrue(session.isFinished)
    }
}
