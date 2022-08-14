//
//  DomainLayer+Injection.swift
//
//
//  Created by Lukáš Růžička on 30.07.2022.
//

import Utils

extension Resolver {

    public static func registerDomainLayer() {
        register(GetComingEvents.self) { GetComingEventsImpl() }
        register(GetSessionDetailsForEvent.self) { GetSessionDetailsForEventImpl() }
        register(GetForecastForEvent.self) { GetForecastForEventImpl() }
    }
}
