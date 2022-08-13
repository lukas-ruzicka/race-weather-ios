//
//  SeriesSettingsViewModel.swift
//  
//
//  Created by Lukáš Růžička on 30.07.2022.
//

import Combine
import DomainLayer
import Utils

final class SeriesSettingsViewModel: ObservableObject {

    // MARK: - Subtypes
    class SerieItem {

        let serie: Serie
        var isChecked: Bool = false

        init(serie: Serie) {
            self.serie = serie
        }
    }

    // MARK: - Properties
    @Published var serieItems: [SerieItem] = []

    @Injected private var seriesRepository: SeriesRepository

    // MARK: - Init
    init() {
        serieItems = seriesRepository.getAll().map { SerieItem(serie: $0) }
        seriesRepository.getAvailable().forEach { availableSerie in
            serieItems.first(where: { availableSerie == $0.serie })?.isChecked = true
        }
    }

    // MARK: - Interactions
    func onSerieItemChanged(to isChecked: Bool, item: SerieItem) {
        item.isChecked = isChecked
        let checkedSeries = serieItems.filter(\.isChecked)
        seriesRepository.setAvailable(checkedSeries.map(\.serie))
    }
}
