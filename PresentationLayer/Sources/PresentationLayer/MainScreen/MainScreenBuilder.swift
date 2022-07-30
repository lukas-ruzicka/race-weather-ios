//
//  MainScreenBuilder.swift
//  
//
//  Created by Lukáš Růžička on 30.07.2022.
//

public enum MainScreenBuilder {

    public static func build() -> MainScreenView {
        let viewModel = MainScreenViewModel()
        return MainScreenView(viewModel: viewModel)
    }
}
