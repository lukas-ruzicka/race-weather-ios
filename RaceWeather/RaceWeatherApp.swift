//
//  RaceWeatherApp.swift
//  RaceWeather
//
//  Created by Lukas Ruzicka on 30.07.2022.
//

import DomainLayer
import PresentationLayer
import SwiftUI
import Utils

@main
struct RaceWeatherApp: App {

    @ObservedObject private var comingTabRouter = Router(root: Resolver.resolve(ComingScreenView.self))
    @ObservedObject private var seriesTabRouter = Router(root: Resolver.resolve(SeriesListView.self))

    var body: some Scene {
        WindowGroup {
            TabView {
                tab(router: comingTabRouter,
                    path: $comingTabRouter.path,
                    symbol: .stopwatch,
                    title: ComingScreenView.title)
                tab(router: seriesTabRouter,
                    path: $seriesTabRouter.path,
                    symbol: .list,
                    title: SeriesListView.title)
            }
        }
    }
}

// MARK: - Subviews
private extension RaceWeatherApp {

    func tab(router: Router, path: Binding<[NavigationDestination]>,
             symbol: SFSymbol, title: Text) -> some View {
        NavigationStack(path: path) {
            router.root
                .navigationDestination(for: NavigationDestination.self) {
                    router.destination(for: $0)
                }
        }
        .tabItem {
            symbol
            title
        }
    }
}
