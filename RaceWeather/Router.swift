//
//  Router.swift
//  RaceWeather
//
//  Created by Lukas Ruzicka on 28.10.2022.
//

import Combine
import PresentationLayer
import SwiftUI
import Utils

final class Router: ObservableObject {

    // MARK: - Properties
    let root: AnyView

    @Published var path: [NavigationDestination] = []
    private var stack: [NavigationDestination: AnyView] = [:]

    private var pathObservingCancellable: Cancellable?

    // MARK: - Init
    init(root: some View) {
        self.root = AnyView(root)
        observePath()
    }

    // MARK: - Routing
    func destination(for navigationDestination: NavigationDestination) -> AnyView {
        if let stackedDestination = stack[navigationDestination] {
            return stackedDestination
        }
        let destination = AnyView(navigationDestination.destination)
        stack[navigationDestination] = destination
        return destination
    }
}

// MARK: - Stack clearing
private extension Router {

    func observePath() {
        pathObservingCancellable = $path
            .sink { [weak self] in
                self?.clearStack(for: $0)
            }
    }

    func clearStack(for path: [NavigationDestination]) {
        stack.keys.forEach {
            if !path.contains($0) {
                stack.removeValue(forKey: $0)
            }
        }
    }
}
