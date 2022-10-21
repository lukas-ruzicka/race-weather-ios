//
//  DataLayer+Injection.swift
//
//
//  Created by Lukas Ruzicka on 30.07.2022.
//

import DomainLayer
import Utils

extension Resolver {

    public static func registerDataLayer() {
        registerRepositories()
        registerDataSources()
    }

    private static func registerRepositories() {
        register(EventsRepository.self) { (_, args) in
            switch args.get() as Serie {
            case .formula1:
                return Formula1EventsRepositoryImpl()
            case .motogp:
                return MotoGPEventsRepositoryImpl()
            }
        }
        .scope(.unique)
        register(SeriesRepository.self) { SeriesRepositoryImpl() }
            .scope(.shared)
        register(WeatherRepository.self) { WeatherRepositoryImpl() }
            .scope(.shared)
    }

    private static func registerDataSources() {
        register(KeyValueStorage.self) { UserDefaultsImpl() }
            .scope(.shared)
    }
}
