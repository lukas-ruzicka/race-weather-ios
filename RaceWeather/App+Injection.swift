//
//  App+Injection.swift
//  RaceWeather
//
//  Created by Lukas Ruzicka on 30.07.2022.
//

import DataLayer
import DomainLayer
import PresentationLayer
import Utils

extension Resolver: ResolverRegistering {

    @MainActor
    public static func registerAllServices() {
        registerPresentationLayer()
        registerDomainLayer()
        registerDataLayer()
    }
}
