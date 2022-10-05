//
//  SerieDetailViewModel.swift
//  
//
//  Created by Lukas Ruzicka on 13.08.2022.
//

import Combine
import DomainLayer
import Utils

@MainActor
final class SerieDetailViewModel: ObservableObject {

    // MARK: - Properties
    @Published var events: [Event]?
    @Published var isLoading = false
    @Published var error: Error?

    let serie: Serie

    private let eventsRepository: EventsRepository

    // MARK: - Init
    init(serie: Serie) {
        self.serie = serie
        eventsRepository = Resolver.resolve(args: serie)
    }

    // MARK: - Interactions
    func onAppear() {
        Task {
            isLoading = true
            do {
                events = try await eventsRepository.getAll()
                    .filter { $0.sessions.contains(where: { !$0.isFinished }) }
            } catch {
                self.error = error
            }
            isLoading = false
        }
    }
}
