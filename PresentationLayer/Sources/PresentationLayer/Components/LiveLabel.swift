//
//  LiveLabel.swift
//  
//
//  Created by Lukas Ruzicka on 15.10.2022.
//

import SwiftUI

struct LiveLabel: View {

    // MARK: - Properties
    @State private var circleScale: CGFloat = 0.9
    @State private var circleOpacity: CGFloat = 1

    // MARK: - Body
    var body: some View {
        HStack {
            Circle()
                .fill(Color.red)
                .frame(size: 8)
                .scaleEffect(circleScale)
                .opacity(circleOpacity)
                .animation(.easeOut(duration: 1).repeatForever(autoreverses: true),
                           value: circleScale)
            L10n.live
                .font(.caption)
        }
        .onAppear {
            circleScale = 1.1
            circleOpacity = 0.8
        }
    }
}

// MARK: - Preview
struct LiveLabel_Previews: PreviewProvider {

    static var previews: some View {
        LiveLabel()
    }
}
