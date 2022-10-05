//
//  PresentationLayer+Injection.swift
//
//
//  Created by Lukas Ruzicka on 30.07.2022.
//

import Utils

extension Resolver {

    @MainActor
    public static func registerPresentationLayer() {
        register { ComingScreenBuilder.build() }
        register { SettingsBuilder.build() }
        register { SeriesListBuilder.build() }
        register { (_, args) in SerieDetailBuilder.build(serie: args.get()) }
        register { (_, args) in EventDetailBuilder.build(event: args.get()) }
        register { (_, args) in SessionDetailBuilder.build(sessionDetail: args.get()) }
    }
}
