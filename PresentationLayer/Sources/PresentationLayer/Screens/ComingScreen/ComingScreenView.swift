//
//  ComingScreenView.swift
//  RaceWeather
//
//  Created by Lukas Ruzicka on 15.10.2022.
//

import SwiftUI
import Utils

public struct ComingScreenView: View {

    // MARK: - Static
    public static let title = L10n.ComingScreen.title

    // MARK: - Properties
    @ObservedObject var viewModel: ComingScreenViewModel

    @Environment(\.scenePhase) var scenePhase

    private let padding: CGFloat = 16

    // MARK: - Body
    public var body: some View {
        ScrollView {
            LazyVStack {
                if viewModel.comingEventsWithForecast?.isEmpty == false || !viewModel.liveSessions.isEmpty {
                    liveSessions
                    comingEvents
                } else if viewModel.loadingProgress == nil, viewModel.comingEventsWithForecast != nil {
                    noComingEvents
                }
            }
        }
        .refreshable {
            viewModel.refresh()
        }
        .animation(.default, value: viewModel.liveSessions)
        .animation(.default, value: viewModel.comingEventsWithForecast)
        .showLoadingProgress(progress: viewModel.shouldShowLoadingProgress ? viewModel.loadingProgress : nil)
        .background(Color.Background.secondary)
        .navigationTitle(Self.title)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                loadingSpinner
            }
            ToolbarItem(placement: .navigationBarTrailing) {
                settingsLink
            }
        }
        .onAppear {
            viewModel.onAppear()
        }
        .onDisappear {
            viewModel.onDisappear()
        }
        .onChange(of: scenePhase) {
            if viewModel.comingEventsWithForecast != nil && $0 == .active {
                viewModel.refresh()
            }
        }
        .handleError($viewModel.error, onRetry: { viewModel.refresh() })
    }
}

// MARK: - Subviews
private extension ComingScreenView {

    @ViewBuilder
    var liveSessions: some View {
        ForEach(viewModel.liveSessions, id: \.self) { liveSession in
            NavigationLink {
                Resolver.resolve(SessionDetailView.self, args: liveSession.sessionDetail)
            } label: {
                LiveSessionThumbnail(data: liveSession)
            }
            .padding([.horizontal, .top], padding)
        }
        if !viewModel.liveSessions.isEmpty {
            Divider()
                .padding(.top, padding)
        }
    }

    var comingEvents: some View {
        ForEach(viewModel.comingEventsWithForecast ?? [], id: \.self) { eventWithForecast in
            NavigationLink {
                Resolver.resolve(EventDetailView.self, args: eventWithForecast.event)
            } label: {
                EventThumbnail(eventWithForecast: eventWithForecast)
            }
            .padding([.horizontal, .top], padding)
        }
    }

    var noComingEvents: some View {
        L10n.noEvents
            .font(.headline)
            .padding()
    }

    @ViewBuilder
    var loadingSpinner: some View {
        if !viewModel.shouldShowLoadingProgress && viewModel.loadingProgress != nil {
            ProgressView()
        }
    }

    var settingsLink: some View {
        NavigationLink {
            Resolver.resolve(SettingsView.self)
        } label: {
            SFSymbol.gear
        }
    }
}

// MARK: - Preview
struct ComingScreenView_Previews: PreviewProvider {

    static var previews: some View {
        ComingScreenView(viewModel: .init())
    }
}
