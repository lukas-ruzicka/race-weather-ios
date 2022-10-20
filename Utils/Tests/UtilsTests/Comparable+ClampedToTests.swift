//
//  Comparable+ClampedToTests.swift
//  
//
//  Created by Lukas Ruzicka on 20.10.2022.
//

@testable import Utils
import XCTest

final class Comparable_ClampedToTests: XCTestCase {

    func testLowerThanRange() {
        XCTAssertEqual(5.5.clamped(to: 6...10), 6)
        XCTAssertEqual((-4.8).clamped(to: -4...0), -4)
    }

    func testRangeLowerBound() {
        XCTAssertEqual(6.3.clamped(to: 6.3...8.4), 6.3)
        XCTAssertEqual((-3.7).clamped(to: -3.7...(-0.1)), -3.7)
    }

    func testInRange() {
        XCTAssertEqual(7.2.clamped(to: 6.3...8.4), 7.2)
        XCTAssertEqual((-1.6).clamped(to: -3.7...1.5), -1.6)
    }

    func testRangeUpperBound() {
        XCTAssertEqual(8.4.clamped(to: 6.3...8.4), 8.4)
        XCTAssertEqual((-0.1).clamped(to: -3.7...(-0.1)), -0.1)
    }

    func testHigherThanRange() {
        XCTAssertEqual(10.3.clamped(to: 6...10), 10)
        XCTAssertEqual((-0.3).clamped(to: -4...(-0.7)), -0.7)
    }
}
