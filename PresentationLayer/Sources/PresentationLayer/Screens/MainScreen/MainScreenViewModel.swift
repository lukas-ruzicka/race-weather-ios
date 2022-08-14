//
//  MainScreenViewModel.swift
//  
//
//  Created by Lukáš Růžička on 30.07.2022.
//

import Combine
import DomainLayer
import Utils

@MainActor
final class MainScreenViewModel: ObservableObject {

    // MARK: - Properties
    @Published var comingEventsWithForecast: [EventWithForecast] = []
    @Published var loadingProgress: Double? = nil

    @Injected private var getComingSessions: GetComingEvents
    @Injected private var getForecastForEvent: GetForecastForEvent

    // MARK: - Interactions
    func onAppear() {
        Task {
            loadingProgress = 0
            let comingEvents = try await getComingSessions.use()
                .sorted(by: { $0.mainDate ?? .init() < $1.mainDate ?? .init() })
            let loadingProgressStep = 1 / Double(comingEvents.count + 1)
            loadingProgress = loadingProgressStep
            for event in comingEvents {
                let freshEventWithForecast = try await getForecastForEvent.use(event: event)
                if let index = comingEventsWithForecast.firstIndex(where: { $0.event.id == event.id }) {
                    comingEventsWithForecast[index] = freshEventWithForecast
                } else {
                    comingEventsWithForecast.append(freshEventWithForecast)
                }
                loadingProgress? += loadingProgressStep
            }
            loadingProgress = nil
        }
    }
}
