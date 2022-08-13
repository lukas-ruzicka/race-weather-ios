//
//  SerieDetailBuilder.swift
//  
//
//  Created by Lukáš Růžička on 13.08.2022.
//

import DomainLayer

public enum SerieDetailBuilder {

    public static func build(serie: Serie) -> SerieDetailView {
        let viewModel = SerieDetailViewModel(serie: serie)
        return .init(viewModel: viewModel)
    }
}
