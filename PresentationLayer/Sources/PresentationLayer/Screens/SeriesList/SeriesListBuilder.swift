//
//  SeriesListBuilder.swift
//  
//
//  Created by Lukáš Růžička on 13.08.2022.
//

public enum SeriesListBuilder {

    public static func build() -> SeriesListView {
        let viewModel = SeriesListViewModel()
        return .init(viewModel: viewModel)
    }
}
