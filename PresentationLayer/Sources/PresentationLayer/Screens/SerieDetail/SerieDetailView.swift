//
//  SerieDetailView.swift
//  
//
//  Created by Lukáš Růžička on 13.08.2022.
//

import SwiftUI

public struct SerieDetailView: View {

    @ObservedObject var viewModel: SerieDetailViewModel

    public var body: some View {
        EventsList(events: viewModel.events)
            .navigationTitle(viewModel.serie.name)
            .navigationBarTitleDisplayMode(.inline)
            .onAppear {
                viewModel.onAppear()
            }
    }
}

struct SerieDetailView_Previews: PreviewProvider {

    static var previews: some View {
        SerieDetailView(viewModel: .init(serie: .formula1))
            .previewDisplayName("Formula 1")
        SerieDetailView(viewModel: .init(serie: .motogp))
            .previewDisplayName("MotoGP")
    }
}
