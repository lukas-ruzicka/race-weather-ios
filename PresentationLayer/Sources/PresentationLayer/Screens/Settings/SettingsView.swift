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

    @Environment(\.openURL) private var openURL

    // MARK: - Body
    public var body: some View {
        List {
            adjustSeriesSection
            feedbackSection
        }
        .foregroundColor(.Text.primary)
        .navigationTitle(L10n.Settings.title)
        .onAppear {
            viewModel.onAppear()
        }
    }
}

// MARK: - Subviews
private extension SettingsView {

    var adjustSeriesSection: some View {
        Section {
            ForEach(viewModel.serieItems, id: \.serie) { item in
                Toggle(item.serie.name, isOn: .init(get: { item.isChecked },
                                                    set: { viewModel.onSerieItemChanged(to: $0, item: item) }))
            }
        } header: {
            L10n.Settings.adjustSeries
        }
    }

    var feedbackSection: some View {
        Section {
            Button {
                openURL(URL(string: L10n.Settings.Feedback.linkString)!)
            } label: {
                L10n.Settings.Feedback.actionLabel
            }
        } header: {
            L10n.Settings.Feedback.title
        } footer: {
            L10n.Settings.Feedback.footnote
        }
    }
}

// MARK: - Preview
struct SettingsView_Previews: PreviewProvider {

    static var previews: some View {
        SettingsView(viewModel: .init())
    }
}
