//
//  Wind+Mock.swift
//  
//
//  Created by Lukas Ruzicka on 14.08.2022.
//

public extension Wind {

    static var mockSlow: Wind {
        .init(direction: .init(value: 65, unit: .degrees),
              speed: .init(value: 4, unit: .kilometersPerHour),
              gust: nil)
    }

    static var mockFast: Wind {
        .init(direction: .init(value: 193, unit: .degrees),
              speed: .init(value: 84, unit: .kilometersPerHour),
              gust: nil)
    }

    static var mockGusty: Wind {
        .init(direction: .init(value: 307, unit: .degrees),
              speed: .init(value: 69, unit: .kilometersPerHour),
              gust: .init(value: 127, unit: .kilometersPerHour))
    }

    static var mockRandom: Wind {
        [.mockSlow, .mockFast, .mockGusty].randomElement()!
    }
}
