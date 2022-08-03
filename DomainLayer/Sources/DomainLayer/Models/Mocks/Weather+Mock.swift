//
//  Weather+Mock.swift
//  
//
//  Created by Lukáš Růžička on 13.08.2022.
//

public extension Weather {

    static var mockRandom: Weather {
        .init(type: .allCases.randomElement()!,
              temperature: [18, 21, 23, 28].randomElement()!,
              chanceOfRain: [0, 30, 55, 75, 90].randomElement()!)
    }
}
