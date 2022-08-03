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
        NavigationView {
            ScrollView {
                VStack(spacing: 24) {
                    ForEach(viewModel.comingEvents, id: \.self) {
                        EventOverview(event: $0)
                    }
                }
                .padding()
            }
            .navigationTitle("Main screen")
            .toolbar {
                NavigationLink("Adjust series") {
                    Resolver.resolve(SeriesListView.self)
                }
            }
            .onAppear {
                viewModel.loadData()
            }
        }
    }
}

struct MainScreenView_Previews: PreviewProvider {

    static var previews: some View {
        MainScreenView(viewModel: .init())
    }
}
