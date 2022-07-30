//
//  App+Injection.swift
//  RaceWeather
//
//  Created by Lukáš Růžička on 30.07.2022.
//

import DataLayer
import DomainLayer
import PresentationLayer
import Utils

extension Resolver: ResolverRegistering {

    public static func registerAllServices() {
        registerPresentationLayer()
        registerDomainLayer()
        registerDataLayer()
    }
}
