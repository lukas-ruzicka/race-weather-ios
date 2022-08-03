//
//  EventsRepository.swift
//  
//
//  Created by Lukáš Růžička on 30.07.2022.
//

public protocol EventsRepository {

    func getAll() async throws -> [Event]
    func getComing() async throws -> Event
}
