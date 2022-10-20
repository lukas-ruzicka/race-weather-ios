//
//  DoubleArray+AverageTests.swift
//  
//
//  Created by Lukas Ruzicka on 20.10.2022.
//

import XCTest

final class DoubleArray_AverageTests: XCTestCase {

    func testPositiveValues() {
        XCTAssertEqual([0.7, 1.9, 8.2].average.rounded(to: 1), 3.6)
    }

    func testNegativeValues() {
        XCTAssertEqual([-0.7, -1.9, -8.2].average.rounded(to: 1), -3.6)
    }

    func testMixedValues() {
        XCTAssertEqual([-0.7, 1.9, -8.2, 5.8].average.rounded(to: 1), -0.3)
    }
}

private extension Double {

    func rounded(to decimalPlaces: Int) -> Double {
        let multiplier = pow(10, Double(decimalPlaces))
        return Darwin.round(self * multiplier) / multiplier
    }
}
