//
//  RainDetail.swift
//  
//
//  Created by Lukáš Růžička on 14.08.2022.
//

import Foundation

public struct RainDetail: Hashable {

    public let date: Date
    public let chance: Double
    public let intensity: Measurement<UnitSpeed>

    public init(date: Date, chance: Double, intensity: Measurement<UnitSpeed>) {
        self.date = date
        self.chance = chance
        self.intensity = intensity
    }
}
