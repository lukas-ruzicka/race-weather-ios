//
//  SeriesListViewModel.swift
//  
//
//  Created by Lukas Ruzicka on 13.08.2022.
//

import Combine
import DomainLayer
import Utils

@MainActor
final class SeriesListViewModel: ObservableObject {

    // MARK: - Properties
    @Published var series: [Serie] = []

    @Injected private var seriesRepository: SeriesRepository

    // MARK: - Interactions
    func onAppear() {
        series = seriesRepository.getAvailable()
    }
}
