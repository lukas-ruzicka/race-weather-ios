//
//  SeriesListView.swift
//  
//
//  Created by Lukáš Růžička on 30.07.2022.
//

import SwiftUI

public struct SeriesListView: View {

    @ObservedObject var viewModel: SeriesListViewModel

    public var body: some View {
        List {
            ForEach(viewModel.serieItems, id: \.serie) { item in
                Toggle(item.serie.rawValue, isOn: .init(get: { item.isChecked },
                                                        set: { viewModel.onSerieItemChanged(to: $0, item: item) }))
            }
        }
    }
}

struct SeriesListView_Previews: PreviewProvider {

    static var previews: some View {
        SeriesListView(viewModel: .init())
    }
}
