//
//  SessionDetailViewModel.swift
//  
//
//  Created by Lukáš Růžička on 13.08.2022.
//

import Combine
import DomainLayer
import Utils

@MainActor
final class SessionDetailViewModel: ObservableObject {

    // MARK: - Properties
    @Published var rainDetail: [RainDetail] = []
    @Published var isLoading = false

    let sessionDetail: SessionDetail

    @Injected private var weatherRepository: WeatherRepository

    // MARK: - Init
    init(sessionDetail: SessionDetail) {
        self.sessionDetail = sessionDetail
    }

    // MARK: - Interactions
    func onAppear() {
        guard !sessionDetail.isFinished else { return }
        Task {
            isLoading = true
            rainDetail = try await weatherRepository.getRainDetail(for: sessionDetail.event.location, at: sessionDetail.dateRange)
            isLoading = false
        }
    }
}
