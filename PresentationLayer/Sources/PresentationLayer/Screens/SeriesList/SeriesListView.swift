//
//  SeriesListView.swift
//  
//
//  Created by Lukas Ruzicka on 13.08.2022.
//

import DomainLayer
import SwiftUI
import Utils

public struct SeriesListView: View {

    // MARK: - Static
    public static let title = L10n.SeriesList.title

    // MARK: - Properties
    @ObservedObject var viewModel: SeriesListViewModel

    // MARK: - Body
    public var body: some View {
        List {
            ForEach(viewModel.series, id: \.self) {
                serieRow($0)
            }
        }
        .foregroundColor(.Text.primary)
        .navigationTitle(Self.title)
        .onAppear {
            viewModel.onAppear()
        }
    }
}

// MARK: - Subviews
private extension SeriesListView {

    func serieRow(_ serie: Serie) -> some View {
        NavigationLink {
            Resolver.resolve(SerieDetailView.self, args: serie)
        } label: {
            HStack(spacing: 16) {
                serie.icon
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(size: 40)
                Text(serie.name)
            }
        }
    }
}

// MARK: - Preview
struct SeriesListView_Previews: PreviewProvider {

    static var previews: some View {
        SeriesListView(viewModel: .init())
    }
}
