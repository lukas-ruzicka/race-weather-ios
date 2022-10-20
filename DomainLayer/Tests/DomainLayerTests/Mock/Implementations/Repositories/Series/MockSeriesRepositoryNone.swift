//
//  MockSeriesRepositoryNone.swift
//  
//
//  Created by Lukas Ruzicka on 20.10.2022.
//

import DomainLayer

final class MockSeriesRepositoryNone {}

// MARK: - Protocol conformance
extension MockSeriesRepositoryNone: SeriesRepository {

    func getAll() -> [Serie] {
        Serie.allCases
    }

    func getAvailable() -> [Serie] {
        []
    }

    func setAvailable(_ series: [Serie]) {}
}
