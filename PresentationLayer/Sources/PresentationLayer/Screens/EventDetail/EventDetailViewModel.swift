//
//  EventDetailViewModel.swift
//  
//
//  Created by Lukas Ruzicka on 13.08.2022.
//

import Combine
import DomainLayer
import Foundation
import Utils

@MainActor
final class EventDetailViewModel: ObservableObject {

    // MARK: - Properties
    @Published var eventWithForecast: EventWithForecast
    @Published var isLoading = false
    @Published var error: Error?

    private lazy var eventDateRangeFormatter: DateIntervalFormatter = {
        let formatter = DateIntervalFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .none
        return formatter
    }()
    var eventDateRangeFormatted: String {
        eventDateRangeFormatter.string(from: eventWithForecast.event.start, to: eventWithForecast.event.end)
    }

    @Injected private var getForecastForEvent: GetForecastForEvent

    // MARK: - Init
    init(event: Event) {
        eventWithForecast = .init(event: event, dailyForecast: nil, sessionDetails: nil)
    }

    // MARK: - Interactions
    func onAppear() {
        Task {
            isLoading = true
            do {
                if let eventWithForecast = try await getForecastForEvent.use(event: eventWithForecast.event) {
                    self.eventWithForecast = eventWithForecast
                }
            } catch {
                self.error = error
            }
            isLoading = false
        }
    }

    func getSessionDetail(for session: Session) -> SessionDetail {
        eventWithForecast.sessionDetails?.first(where: { $0.id == session.id }) ?? .init(from: eventWithForecast, session: session)
    }
}
