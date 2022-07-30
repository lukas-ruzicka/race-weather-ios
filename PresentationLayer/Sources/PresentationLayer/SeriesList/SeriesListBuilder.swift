//
//  SeriesListBuilder.swift
//  
//
//  Created by Lukáš Růžička on 30.07.2022.
//

public enum SeriesListBuilder {

    public static func build() -> SeriesListView {
        let viewModel = SeriesListViewModel()
        return SeriesListView(viewModel: viewModel)
    }
}
