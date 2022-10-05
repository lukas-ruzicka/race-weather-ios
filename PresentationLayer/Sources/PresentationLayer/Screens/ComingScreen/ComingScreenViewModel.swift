//
//  ComingScreenViewModel.swift
//  RaceWeather
//
//  Created by Lukas Ruzicka on 15.10.2022.
//

import Combine
import DomainLayer
import Foundation
import Utils

@MainActor
final class ComingScreenViewModel: ObservableObject {

    // MARK: - Properties
    @Published var comingEventsWithForecast: [EventWithForecast]?
    @Published var liveSessions: [LiveSessionData] = []
    @Published var loadingProgress: Double?
    var shouldShowLoadingProgress: Bool {
        comingEventsWithForecast == nil
    }
    @Published var error: Error?

    @Injected private var getComingEvents: GetComingEvents
    @Injected private var getForecastForEvent: GetForecastForEvent
    @Injected private var weatherRepository: WeatherRepository

    private var fetchTask: Task<Void, Error>?

    // MARK: - Interactions
    func onAppear() {
        loadData(handleError: comingEventsWithForecast == nil)
    }

    func onDisappear() {
        fetchTask?.cancel()
    }

    func refresh() {
        loadData(handleError: true)
    }
}

// MARK: - Supporting functions
private extension ComingScreenViewModel {

    func loadData(handleError: Bool = false) {
        fetchTask?.cancel()
        fetchTask = Task {
            do {
                try await fetchComingEvents()
            } catch {
                if handleError && error as? CancellationError == nil {
                    self.error = error
                }
            }
        }
    }

    func fetchComingEvents() async throws {
        loadingProgress = 0

        let comingEvents = try await getComingEvents.use()
            .sorted(by: { $0.mainDate ?? .init() < $1.mainDate ?? .init() })

        let loadingProgressStep = 1 / Double(comingEvents.count + 1)
        loadingProgress = loadingProgressStep

        var freshComingEventsWithForecast: [EventWithForecast] = []
        var freshLiveSessions: [LiveSessionData] = []
        for event in comingEvents {
            let eventWithForecast = try await getForecastForEvent.use(event: event)
            if let eventWithForecast {
                if event.sessions.contains(where: { $0.hasntStartedYet }) {
                    freshComingEventsWithForecast.append(eventWithForecast)
                }
                if let liveSession = try await fetchLiveSession(from: eventWithForecast) {
                    freshLiveSessions.append(liveSession)
                }
            }
            loadingProgress? += loadingProgressStep
        }
        comingEventsWithForecast = freshComingEventsWithForecast
            .sorted(by: { $0.event.mainDate ?? .init() < $1.event.mainDate ?? .init() })
        liveSessions = freshLiveSessions
            .sorted(by: { $0.sessionDetail.dateRange.lowerBound < $1.sessionDetail.dateRange.lowerBound })

        loadingProgress = nil
    }

    func fetchLiveSession(from eventWithForecast: EventWithForecast) async throws -> LiveSessionData? {
        guard let liveSession = eventWithForecast.sessionDetails?.first(where: { $0.isLive }) else { return nil }
        return LiveSessionData(
            sessionDetail: liveSession,
            rainDetail: try await weatherRepository.getRainDetail(
                for: liveSession.event.location,
                at: Date()...liveSession.dateRange.upperBound
            )
        )
    }
}
