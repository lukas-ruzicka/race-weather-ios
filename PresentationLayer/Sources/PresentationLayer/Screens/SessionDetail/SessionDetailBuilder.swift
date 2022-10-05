//
//  SessionDetailBuilder.swift
//  
//
//  Created by Lukas Ruzicka on 13.08.2022.
//

import DomainLayer

public enum SessionDetailBuilder {

    @MainActor
    public static func build(sessionDetail: SessionDetail) -> SessionDetailView {
        let viewModel = SessionDetailViewModel(sessionDetail: sessionDetail)
        return .init(viewModel: viewModel)
    }
}
