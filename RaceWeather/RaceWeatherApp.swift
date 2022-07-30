//
//  RaceWeatherApp.swift
//  RaceWeather
//
//  Created by Lukáš Růžička on 30.07.2022.
//

import PresentationLayer
import SwiftUI
import Utils

@main
struct RaceWeatherApp: App {

    var body: some Scene {
        WindowGroup {
            Resolver.resolve(MainScreenView.self)
        }
    }
}
