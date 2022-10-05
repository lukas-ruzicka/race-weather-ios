//
//  Rain.swift
//  
//
//  Created by Lukas Ruzicka on 14.08.2022.
//

import Foundation

public struct Rain: Hashable {

    public let chance: Double
    public let amount: Measurement<UnitLength>

    public init(chance: Double, amount: Measurement<UnitLength>) {
        self.chance = chance
        self.amount = amount
    }
}
