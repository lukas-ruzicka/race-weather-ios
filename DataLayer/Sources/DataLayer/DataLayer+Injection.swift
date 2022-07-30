//
//  DataLayer+Injection.swift
//
//
//  Created by Lukáš Růžička on 30.07.2022.
//

import DomainLayer
import Utils

extension Resolver {

    public static func registerDataLayer() {
        register(SeriesRepository.self) { SeriesRepositoryImpl() }
    }
}
