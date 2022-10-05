//
//  SessionDetailViewModel.swift
//  
//
//  Created by Lukas Ruzicka on 13.08.2022.
//

import Combine
import DomainLayer
import Foundation
import Utils

@MainActor
final class SessionDetailViewModel: ObservableObject {

    // MARK: - Properties
    @Published var rainDetail: [RainDetail] = []
    @Published var isLoading = false
    @Published var error: Error?

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
            var range = sessionDetail.dateRange
            let currentDate = Date()
            if currentDate > range.lowerBound {
                range = currentDate...sessionDetail.dateRange.upperBound
            }
            do {
                rainDetail = try await weatherRepository.getRainDetail(for: sessionDetail.event.location,
                                                                       at: range)
            } catch {
                self.error = error
            }
            isLoading = false
        }
    }
}
