//
//  Wind.swift
//  
//
//  Created by Lukas Ruzicka on 14.08.2022.
//

import Foundation

public struct Wind: Hashable {

    public let direction: Measurement<UnitAngle>
    public let speed: Measurement<UnitSpeed>
    public let gust: Measurement<UnitSpeed>?

    public init(direction: Measurement<UnitAngle>, speed: Measurement<UnitSpeed>, gust: Measurement<UnitSpeed>?) {
        self.direction = direction
        self.speed = speed
        self.gust = gust
    }
}
