//
//  MockSeriesRepositoryAll.swift
//  
//
//  Created by Lukas Ruzicka on 20.10.2022.
//

import DomainLayer

final class MockSeriesRepositoryAll {}

// MARK: - Protocol conformance
extension MockSeriesRepositoryAll: SeriesRepository {

    func getAll() -> [Serie] {
        Serie.allCases
    }

    func getAvailable() -> [Serie] {
        Serie.allCases
    }

    func setAvailable(_ series: [Serie]) {}
}
