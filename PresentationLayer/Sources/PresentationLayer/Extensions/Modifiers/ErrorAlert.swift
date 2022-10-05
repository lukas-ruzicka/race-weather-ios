//
//  ErrorAlert.swift
//  
//
//  Created by Lukas Ruzicka on 18.10.2022.
//

import SwiftUI

extension View {

    func handleError(_ error: Binding<Error?>, onRetry: (() -> Void)? = nil) -> some View {
        modifier(ErrorAlert(error: error, onRetry: onRetry))
    }
}

private struct ErrorAlert: ViewModifier {

    // MARK: - Properties
    @Binding var error: Error?
    var onRetry: (() -> Void)?

    // MARK: - Body
    func body(content: Content) -> some View {
        let isPresented = Binding<Bool>(get: { error != nil }, set: { error = $0 ? error : nil })
        content
            .alert(isPresented: isPresented) {
                if let onRetry {
                    return Alert(title: L10n.Error.title,
                                 message: L10n.Error.message,
                                 primaryButton: .default(L10n.retry, action: onRetry),
                                 secondaryButton: .cancel(L10n.ok))
                }
                return Alert(title: L10n.Error.title,
                             message: L10n.Error.message,
                             dismissButton: .cancel(L10n.ok))
            }
    }
}
