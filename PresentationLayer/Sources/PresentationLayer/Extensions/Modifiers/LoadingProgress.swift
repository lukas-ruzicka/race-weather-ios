//
//  LoadingProgress.swift
//  
//
//  Created by Lukáš Růžička on 28.08.2022.
//

import SwiftUI

extension View {

    func showLoadingProgress(progress: Double?) -> some View {
        modifier(LoadingProgress(progress: progress))
    }
}

private struct LoadingProgress: ViewModifier {

    // MARK: - Properties
    let progress: Double?

    // MARK: - Body
    func body(content: Content) -> some View {
        content
            .overlay {
                if let loadingProgress = progress {
                    VStack {
                        ProgressView(value: loadingProgress)
                            .progressViewStyle(.linear)
                        Spacer()
                    }
                }
            }
            .animation(.easeOut, value: progress)
    }
}
