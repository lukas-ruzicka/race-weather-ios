//
//  SeriesSettingsView.swift
//  
//
//  Created by Lukáš Růžička on 30.07.2022.
//

import SwiftUI

public struct SeriesSettingsView: View {

    @ObservedObject var viewModel: SeriesSettingsViewModel

    public var body: some View {
        List {
            ForEach(viewModel.serieItems, id: \.serie) { item in
                Toggle(item.serie.name, isOn: .init(get: { item.isChecked },
                                                    set: { viewModel.onSerieItemChanged(to: $0, item: item) }))
            }
        }
    }
}

struct SeriesSettingsView_Previews: PreviewProvider {

    static var previews: some View {
        SeriesSettingsView(viewModel: .init())
    }
}
