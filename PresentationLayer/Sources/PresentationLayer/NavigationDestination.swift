//
//  NavigationDestination.swift
//  
//
//  Created by Lukas Ruzicka on 28.10.2022.
//

import DomainLayer
import SwiftUI
import Utils

public enum NavigationDestination: Hashable {

    case settings
    case serieDetail(serie: Serie)
    case eventDetail(event: Event)
    case sessionDetail(sessionDetail: SessionDetail)

    @ViewBuilder
    public var destination: some View {
        switch self {
        case .settings:
            Resolver.resolve(SettingsView.self)
        case .serieDetail(let serie):
            Resolver.resolve(SerieDetailView.self, args: serie)
        case .eventDetail(let event):
            Resolver.resolve(EventDetailView.self, args: event)
        case .sessionDetail(let sessionDetail):
            Resolver.resolve(SessionDetailView.self, args: sessionDetail)
        }
    }
}
