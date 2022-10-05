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

    var body: some Scene {
        WindowGroup {
            if Resolver.resolve(SeriesRepository.self).getAvailable().count > 1 {
                TabView {
                    mainScreen
                    .tabItem {
                        SFSymbol.stopwatch
                        ComingScreenView.title
                    }
                    NavigationView {
                        Resolver.resolve(SeriesListView.self)
                    }
                    .tabItem {
                        SFSymbol.list
                        SeriesListView.title
                    }
                }
            } else {
                mainScreen
            }
        }
    }

    private var mainScreen: some View {
        NavigationView {
            Resolver.resolve(ComingScreenView.self)
        }
    }
}
