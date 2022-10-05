//
//  Rain+Mock.swift
//  
//
//  Created by Lukas Ruzicka on 14.08.2022.
//

public extension Rain {

    static var mockNoRain: Rain {
        .init(chance: 0, amount: .init(value: 0, unit: .millimeters))
    }

    static var mockLittleRain: Rain {
        .init(chance: 0.4, amount: .init(value: 0.3, unit: .millimeters))
    }

    static var mockHeavyRain: Rain {
        .init(chance: 1, amount: .init(value: 4.7, unit: .millimeters))
    }

    static var mockRandom: Rain {
        [.mockNoRain, .mockLittleRain, .mockHeavyRain].randomElement()!
    }
}
