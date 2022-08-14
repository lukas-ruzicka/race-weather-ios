//
//  Wind.swift
//  
//
//  Created by Lukáš Růžička on 14.08.2022.
//

import Foundation

public struct Wind: Hashable {

    public let direction: Measurement<UnitAngle>
    public let speed: Measurement<UnitSpeed>
    public let gust: Measurement<UnitSpeed>?
}
