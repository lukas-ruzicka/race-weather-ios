//
//  Weather+Mock.swift
//  
//
//  Created by Lukáš Růžička on 13.08.2022.
//

public extension Weather {

    static var mockSunny: Weather {
        .init(type: .clear,
              temperature: .init(value: 27, unit: .celsius),
              humidity: 0.63,
              cloudCover: 0.07,
              rain: .mockNoRain,
              wind: .mockRandom,
              sfSymbolName: "sun.max")
    }

    static var mockOvercast: Weather {
        .init(type: .overcast,
              temperature: .init(value: 23, unit: .celsius),
              humidity: 0.55,
              cloudCover: 0.62,
              rain: .mockRandom,
              wind: .mockSlow,
              sfSymbolName: "cloud.sun")
    }

    static var mockLightRain: Weather {
        .init(type: .rain,
              temperature: .init(value: 21, unit: .celsius),
              humidity: 0.68,
              cloudCover: 0.84,
              rain: .mockLittleRain,
              wind: .mockFast,
              sfSymbolName: "cloud.drizzle")
    }

    static var mockHeavyRain: Weather {
        .init(type: .heavyRain,
              temperature: .init(value: 18, unit: .celsius),
              humidity: 0.76,
              cloudCover: 1,
              rain: .mockHeavyRain,
              wind: .mockGusty,
              sfSymbolName: "cloud.rain")
    }

    static var mockRandom: Weather {
        [.mockSunny, .mockOvercast, .mockLightRain, .mockHeavyRain].randomElement()!
    }
}
