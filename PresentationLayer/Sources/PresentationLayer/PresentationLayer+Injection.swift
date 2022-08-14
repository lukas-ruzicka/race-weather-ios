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
        register { SeriesSettingsBuilder.build() }
        register { SeriesListBuilder.build() }
        register { (_, args) in SerieDetailBuilder.build(serie: args.get()) }
        register { (_, args) in EventDetailBuilder.build(eventWithForecast: args.get()) }
        register { (_, args) in SessionDetailBuilder.build(sessionDetail: args.get()) }
    }
}
