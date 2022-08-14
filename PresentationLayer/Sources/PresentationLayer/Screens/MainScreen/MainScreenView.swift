//
//  MainScreenView.swift
//  
//
//  Created by Lukáš Růžička on 30.07.2022.
//

import SwiftUI
import Utils

public struct MainScreenView: View {

    @ObservedObject var viewModel: MainScreenViewModel

    public var body: some View {
        EventsList(eventsWithForecast: viewModel.comingEventsWithForecast, showSerieSectionTitle: true)
            .showLoadingProgress(progress: viewModel.loadingProgress)
            .navigationTitle("Main screen")
            .toolbar {
                NavigationLink("Adjust series") {
                    Resolver.resolve(SeriesSettingsView.self)
                }
            }
            .onAppear {
                viewModel.onAppear()
            }
    }
}

struct MainScreenView_Previews: PreviewProvider {

    static var previews: some View {
        MainScreenView(viewModel: .init())
    }
}
