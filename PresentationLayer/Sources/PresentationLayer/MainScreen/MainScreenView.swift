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
                VStack {
                    Text("This is main screen")
                        .font(.title)
                        .padding()
                }
            }
            .navigationTitle("Main screen")
            .toolbar {
                NavigationLink("Adjust series") {
                    Resolver.resolve(SeriesListView.self)
                }
            }
        }
    }
}

struct MainScreenView_Previews: PreviewProvider {

    static var previews: some View {
        MainScreenView(viewModel: .init())
    }
}
