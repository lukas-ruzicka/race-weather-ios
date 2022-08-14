//
//  SessionDetailBuilder.swift
//  
//
//  Created by Lukáš Růžička on 13.08.2022.
//

import DomainLayer

public enum SessionDetailBuilder {

    public static func build(sessionDetail: SessionDetail) -> SessionDetailView {
        let viewModel = SessionDetailViewModel(sessionDetail: sessionDetail)
        return .init(viewModel: viewModel)
    }
}
