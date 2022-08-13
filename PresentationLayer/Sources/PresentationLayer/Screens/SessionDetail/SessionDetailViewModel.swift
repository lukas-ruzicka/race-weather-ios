//
//  SessionDetailViewModel.swift
//  
//
//  Created by Lukáš Růžička on 13.08.2022.
//

import Combine
import DomainLayer
import Utils

final class SessionDetailViewModel: ObservableObject {

    // MARK: - Properties
    let session: Session

    // MARK: - Init
    init(session: Session) {
        self.session = session
    }

    // MARK: - Interactions
    func onAppear() {
        // TODO: - Handle loading
        // TODO: - Fetch detail weather data
    }
}
