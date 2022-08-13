//
//  SeriesSettingsBuilder.swift
//  
//
//  Created by Lukáš Růžička on 30.07.2022.
//

public enum SeriesSettingsBuilder {

    public static func build() -> SeriesSettingsView {
        let viewModel = SeriesSettingsViewModel()
        return .init(viewModel: viewModel)
    }
}
