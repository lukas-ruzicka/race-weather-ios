//
//  EventsRepository.swift
//  
//
//  Created by Lukas Ruzicka on 30.07.2022.
//

public protocol EventsRepository {

    func getAll() async throws -> [Event]
    func getComing() async throws -> Event
}
