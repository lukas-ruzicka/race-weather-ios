//
//  SeriesListView.swift
//  
//
//  Created by Lukáš Růžička on 13.08.2022.
//

import SwiftUI
import Utils

public struct SeriesListView: View {

    @ObservedObject var viewModel: SeriesListViewModel

    public var body: some View {
        List {
            ForEach(viewModel.series, id: \.self) { serie in
                NavigationLink {
                    Resolver.resolve(SerieDetailView.self, args: serie)
                } label: {
                    HStack {
                        serie.icon
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(size: 40)
                            .padding()
                        Text(serie.name)
                            .font(.title2)
                    }
                }
            }
        }
        .navigationTitle("Series")
        .onAppear {
            viewModel.onAppear()
        }
    }
}

struct SeriesListView_Previews: PreviewProvider {

    static var previews: some View {
        SeriesListView(viewModel: .init())
    }
}
