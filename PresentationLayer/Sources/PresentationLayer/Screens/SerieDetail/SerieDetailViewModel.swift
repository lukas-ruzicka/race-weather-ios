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
    @Published var eventsWithForecast: [EventWithForecast] = []
    @Published var loadingProgress: Double? = nil

    let serie: Serie

    private let eventsRepository: EventsRepository
    @Injected private var getForecastForEvent: GetForecastForEvent

    // MARK: - Init
    init(serie: Serie) {
        self.serie = serie
        eventsRepository = Resolver.resolve(args: serie)
    }

    // MARK: - Interactions
    func onAppear() {
        Task {
            loadingProgress = 0
            let events = try await eventsRepository.getAll()
            let loadingProgressStep = 1 / Double(events.count + 1)
            loadingProgress = loadingProgressStep
            for event in events {
                let freshEventWithForecast = try await getForecastForEvent.use(event: event)
                if let index = eventsWithForecast.firstIndex(where: { $0.event.id == event.id }) {
                    eventsWithForecast[index] = freshEventWithForecast
                } else {
                    eventsWithForecast.append(freshEventWithForecast)
                }
                loadingProgress? += loadingProgressStep
            }
            loadingProgress = nil
        }
    }
}
