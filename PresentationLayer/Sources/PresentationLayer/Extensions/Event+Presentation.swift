//
//  Event+Presentation.swift
//  
//
//  Created by Lukas Ruzicka on 16.10.2022.
//

import DomainLayer
import SwiftUI

extension Event {

    @ViewBuilder
    var flagImage: some View {
        if let flagImageUrl {
            AsyncImage(url: flagImageUrl) {
                $0
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            } placeholder: {
                ProgressView()
            }
            .frame(size: 16)
        }
    }

    private var flagImageUrl: URL? {
        guard let countryCode else { return nil }
        return URL(string: "https://flagcdn.com/48x36/\(countryCode.lowercased()).png")
    }

    @ViewBuilder
    func trackMapImage(size: CGFloat = 96) -> some View {
        if let trackMapUrl {
            AsyncImage(url: trackMapUrl) { phase in
                switch phase {
                case .empty:
                    ProgressView()
                        .frame(size: size)
                case .success(let image):
                    image
                        .resizable()
                        .renderingMode(.template)
                        .aspectRatio(contentMode: .fit)
                        .foregroundColor(.Text.primary)
                        .frame(size: size)
                default:
                    EmptyView()
                }
            }
        }
    }
}
