//
//  SettingsView.swift
//  
//
//  Created by Lukas Ruzicka on 30.07.2022.
//

import SwiftUI

public struct SettingsView: View {

    // MARK: - Properties
    @ObservedObject var viewModel: SettingsViewModel

    // MARK: - Body
    public var body: some View {
        List {
            Section {
                ForEach(viewModel.serieItems, id: \.serie) { item in
                    Toggle(item.serie.name, isOn: .init(get: { item.isChecked },
                                                        set: { viewModel.onSerieItemChanged(to: $0, item: item) }))
                }
            } header: {
                L10n.Settings.adjustSeries
            }
        }
        .foregroundColor(.Text.primary)
        .navigationTitle(L10n.Settings.title)
        .onAppear {
            viewModel.onAppear()
        }
    }
}

// MARK: - Preview
struct SettingsView_Previews: PreviewProvider {

    static var previews: some View {
        SettingsView(viewModel: .init())
    }
}
