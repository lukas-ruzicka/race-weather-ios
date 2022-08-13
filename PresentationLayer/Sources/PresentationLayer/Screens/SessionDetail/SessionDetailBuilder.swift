//
//  SessionDetailBuilder.swift
//  
//
//  Created by Lukáš Růžička on 13.08.2022.
//

import DomainLayer

public enum SessionDetailBuilder {

    public static func build(session: Session) -> SessionDetailView {
        let viewModel = SessionDetailViewModel(session: session)
        return .init(viewModel: viewModel)
    }
}
