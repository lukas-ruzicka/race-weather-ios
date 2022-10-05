//
//  EventWithForecast+Mock.swift
//  
//
//  Created by Lukas Ruzicka on 14.08.2022.
//

public extension EventWithForecast {

    static var mockDetailed: EventWithForecast {
        .init(event: .mockFormula1BelgianGP,
              dailyForecast: nil,
              sessionDetails: SessionDetail.mockWholeWeekend)
    }

    static var mockDaily: EventWithForecast {
        .init(event: .mockFormula1BelgianGP,
              dailyForecast: [
                .init(date: Event.mockFormula1BelgianGP.start, weather: .mockHeavyRain),
                .init(date: Event.mockFormula1BelgianGP.start.addingTimeInterval(24 * 60 * 60), weather: .mockOvercast),
                .init(date: Event.mockFormula1BelgianGP.end, weather: .mockSunny)
              ],
              sessionDetails: nil)
    }

    static var mockNoForecast: EventWithForecast {
        .init(event: .mockFormula1BelgianGP,
              dailyForecast: nil,
              sessionDetails: nil)
    }
}
