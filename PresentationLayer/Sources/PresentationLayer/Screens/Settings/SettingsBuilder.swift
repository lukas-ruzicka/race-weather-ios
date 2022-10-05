//
//  SettingsBuilder.swift
//  
//
//  Created by Lukas Ruzicka on 30.07.2022.
//

public enum SettingsBuilder {

    @MainActor
    public static func build() -> SettingsView {
        let viewModel = SettingsViewModel()
        return .init(viewModel: viewModel)
    }
}
