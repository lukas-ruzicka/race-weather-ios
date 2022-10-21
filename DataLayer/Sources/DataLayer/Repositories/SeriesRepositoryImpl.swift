//
//  SeriesRepositoryImpl.swift
//  
//
//  Created by Lukas Ruzicka on 30.07.2022.
//

import DomainLayer
import Utils

final class SeriesRepositoryImpl {

    // MARK: - Subtypes
    struct AvailableSeries: Codable {

        let series: [String]
    }

    // MARK: - Properties
    @Injected private var keyValueStorage: KeyValueStorage
}

// MARK: - Protocol conformance
extension SeriesRepositoryImpl: SeriesRepository {

    func getAll() -> [Serie] {
        Serie.allCases
    }

    func getAvailable() -> [Serie] {
        let availableSeries: AvailableSeries? = try? keyValueStorage.get(.availableSeries)
        return availableSeries?.series.compactMap { .init(rawValue: $0) } ?? getAll()
    }

    func setAvailable(_ series: [Serie]) {
        let availableSeries = AvailableSeries(series: series.map(\.rawValue))
        try? keyValueStorage.set(availableSeries, for: .availableSeries)
    }
}
