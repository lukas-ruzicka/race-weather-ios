//
//  SettingsViewModel.swift
//  
//
//  Created by Lukas Ruzicka on 30.07.2022.
//

import Combine
import DomainLayer
import Utils

@MainActor
final class SettingsViewModel: ObservableObject {

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
    private var checkedSeriesCount: Int {
        serieItems
            .filter { $0.isChecked }
            .count
    }

    @Injected private var seriesRepository: SeriesRepository

    // MARK: - Interactions
    func onAppear() {
        serieItems = seriesRepository.getAll().map { SerieItem(serie: $0) }
        seriesRepository.getAvailable().forEach { availableSerie in
            serieItems.first(where: { availableSerie == $0.serie })?.isChecked = true
        }
    }

    func onSerieItemChanged(to isChecked: Bool, item: SerieItem) {
        if !isChecked && checkedSeriesCount == 1 {
            return
        }
        item.isChecked = isChecked
        let checkedSeries = serieItems.filter(\.isChecked)
        seriesRepository.setAvailable(checkedSeries.map(\.serie))
    }
}
