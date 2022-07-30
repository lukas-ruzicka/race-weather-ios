//
//  SeriesRepositoryImpl.swift
//  
//
//  Created by Lukáš Růžička on 30.07.2022.
//

import DomainLayer

final class SeriesRepositoryImpl {

    // MARK: - Properties
    private var availableSeries: [Serie] = Serie.allCases
}

// MARK: - Protocol conformance
extension SeriesRepositoryImpl: SeriesRepository {

    func getAll() -> [Serie] {
        Serie.allCases
    }

    func getAvailable() -> [Serie] {
        availableSeries
    }

    func setAvailable(_ series: [Serie]) {
        availableSeries = series
    }
}
