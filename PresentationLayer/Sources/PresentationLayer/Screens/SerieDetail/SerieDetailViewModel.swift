//
//  SerieDetailViewModel.swift
//  
//
//  Created by Lukáš Růžička on 13.08.2022.
//

import Combine
import DomainLayer
import Utils

@MainActor
final class SerieDetailViewModel: ObservableObject {

    // MARK: - Properties
    @Published var events: [Event] = []
    let serie: Serie

    private let getWeatherForSerie: GetWeatherForSerie

    // MARK: - Init
    init(serie: Serie) {
        self.serie = serie
        getWeatherForSerie = Resolver.resolve(args: serie)
    }

    // MARK: - Interactions
    func onAppear() {
        // TODO: - Handle loading
        Task {
            events = try await getWeatherForSerie.use()
        }
    }
}
