//
//  CardBackground.swift
//  
//
//  Created by Lukas Ruzicka on 15.10.2022.
//

import SwiftUI

extension View {

    func cardBackground() -> some View {
        modifier(CardBackgroundModifier())
    }
}

private struct CardBackgroundModifier: ViewModifier {

    // MARK: - Properties
    @Environment(\.colorScheme) var colorScheme

    // MARK: - Body
    func body(content: Content) -> some View {
        content
            .padding(16)
            .frame(maxWidth: .infinity)
            .background(Color.Background.primary)
            .cornerRadius(12)
            .shadow(color: .shadow, radius: colorScheme == .dark ? 0 : 4)
    }
}
