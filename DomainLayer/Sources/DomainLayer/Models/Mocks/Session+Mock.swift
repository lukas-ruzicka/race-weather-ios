//
//  Session+Mock.swift
//  
//
//  Created by Lukáš Růžička on 13.08.2022.
//

public extension Session {

    static var mockFP1: Session {
        .init(name: "FP1", type: .practice, start: .init(), end: .init(),
                                        weather: .init(type: .overcast, temperature: 0, chanceOfRain: 0))
    }

    static var mockQualifying: Session {
        .init(name: "Qualifying", type: .qualifying, start: .init(), end: .init(), weather: .init(type: .sunny, temperature: 23, chanceOfRain: 10))
    }

    static var mockRace: Session {
        .init(name: "Race", type: .race, start: .init(), end: .init(), weather: .init(type: .raining, temperature: 18, chanceOfRain: 85))
    }
}
