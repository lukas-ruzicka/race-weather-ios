//
//  ComingScreenBuilder.swift
//  RaceWeather
//
//  Created by Lukas Ruzicka on 15.10.2022.
//

public enum ComingScreenBuilder {

    @MainActor
    public static func build() -> ComingScreenView {
        let viewModel = ComingScreenViewModel()
        return .init(viewModel: viewModel)
    }
}
