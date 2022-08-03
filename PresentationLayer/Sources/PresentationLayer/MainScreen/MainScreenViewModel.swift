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
    @Published var comingEvents: [Event] = []

    @Injected private var getComingSessions: GetComingSessions

    // MARK: - Interactions
    func loadData() {
        Task {
            comingEvents = try await getComingSessions.use()
                .sorted(by: { $0.mainDate ?? .init() < $1.mainDate ?? .init() })
        }
    }
}
