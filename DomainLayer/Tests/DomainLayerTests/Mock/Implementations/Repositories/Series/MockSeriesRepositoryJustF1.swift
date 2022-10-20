//
//  MockSeriesRepositoryJustF1.swift
//  
//
//  Created by Lukas Ruzicka on 20.10.2022.
//

import DomainLayer

final class MockSeriesRepositoryJustF1 {}

// MARK: - Protocol conformance
extension MockSeriesRepositoryJustF1: SeriesRepository {

    func getAll() -> [Serie] {
        Serie.allCases
    }

    func getAvailable() -> [Serie] {
        [.formula1]
    }

    func setAvailable(_ series: [Serie]) {}
}
