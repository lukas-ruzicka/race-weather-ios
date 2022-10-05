//
//  SeriesListBuilder.swift
//  
//
//  Created by Lukas Ruzicka on 13.08.2022.
//

public enum SeriesListBuilder {

    @MainActor
    public static func build() -> SeriesListView {
        let viewModel = SeriesListViewModel()
        return .init(viewModel: viewModel)
    }
}
