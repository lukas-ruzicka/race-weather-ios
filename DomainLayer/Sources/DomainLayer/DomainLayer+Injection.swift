//
//  DomainLayer+Injection.swift
//
//
//  Created by Lukáš Růžička on 30.07.2022.
//

import Utils

extension Resolver {

    public static func registerDomainLayer() {
        register(GetWeatherForSerie.self) { (_, args) in GetWeatherForSerieImpl(serie: args.get()) }
        register(GetComingSessions.self) { GetComingSessionsImpl() }
    }
}
