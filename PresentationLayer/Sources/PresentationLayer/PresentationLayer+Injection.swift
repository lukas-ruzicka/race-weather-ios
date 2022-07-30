//
//  PresentationLayer+Injection.swift
//
//
//  Created by Lukáš Růžička on 30.07.2022.
//

import Utils

extension Resolver {

    public static func registerPresentationLayer() {
        register { MainScreenBuilder.build() }
        register { SeriesListBuilder.build() }
    }
}
