//
//  Event+Mock.swift
//  
//
//  Created by Lukáš Růžička on 13.08.2022.
//

public extension Event {

    static var mockFormula1Events: [Event] {
        [
            .init(serie: .formula1, id: "14/2022", name: "Belgian GP", location: .init(latitude: 50.43706209479741, longitude: 5.972103651037462), sessions: [
                .init(name: "FP1",
                      type: .practice,
                      start: .init(timeIntervalSince1970: 1661515200),
                      end: .init(timeIntervalSince1970: 1661518800),
                      weather: nil),
                .init(name: "FP2",
                      type: .practice,
                      start: .init(timeIntervalSince1970: 1661526000),
                      end: .init(timeIntervalSince1970: 1661529600),
                      weather: nil),
                .init(name: "FP3",
                      type: .practice,
                      start: .init(timeIntervalSince1970: 1661598000),
                      end: .init(timeIntervalSince1970: 1661601600),
                      weather: nil),
                .init(name: "Qualifying",
                      type: .qualifying,
                      start: .init(timeIntervalSince1970: 1661608800),
                      end: .init(timeIntervalSince1970: 1661612400),
                      weather: nil),
                .init(name: "Race",
                      type: .race,
                      start: .init(timeIntervalSince1970: 1661691600),
                      end: .init(timeIntervalSince1970: 1661698800),
                      weather: nil)
            ]),
            .init(serie: .formula1, id: "15/2022", name: "Dutch GP", location: .init(latitude: 52.388930678559184, longitude: 4.545441310492251), sessions: [
                .init(name: "Race",
                      type: .race,
                      start: .init(timeIntervalSince1970: 1662296400),
                      end: .init(timeIntervalSince1970: 1662303600),
                      weather: nil)
            ])
        ]
    }

    static var mockMotoGPEvents: [Event] {
        [
            .init(serie: .motogp, id: "14/2022", name: "Spanish GP", location: .init(latitude: 50.43706209479741, longitude: 5.972103651037462), sessions: [
                .init(name: "FP1",
                      type: .practice,
                      start: .init(timeIntervalSince1970: 1661515200),
                      end: .init(timeIntervalSince1970: 1661518800),
                      weather: nil),
                .init(name: "FP2",
                      type: .practice,
                      start: .init(timeIntervalSince1970: 1661526000),
                      end: .init(timeIntervalSince1970: 1661529600),
                      weather: nil),
                .init(name: "FP3",
                      type: .practice,
                      start: .init(timeIntervalSince1970: 1661598000),
                      end: .init(timeIntervalSince1970: 1661601600),
                      weather: nil),
                .init(name: "Qualifying",
                      type: .qualifying,
                      start: .init(timeIntervalSince1970: 1661608800),
                      end: .init(timeIntervalSince1970: 1661612400),
                      weather: nil),
                .init(name: "Race",
                      type: .race,
                      start: .init(timeIntervalSince1970: 1661691600),
                      end: .init(timeIntervalSince1970: 1661698800),
                      weather: nil)
            ]),
            .init(serie: .motogp, id: "15/2022", name: "Czech GP", location: .init(latitude: 52.388930678559184, longitude: 4.545441310492251), sessions: [
                .init(name: "Race",
                      type: .race,
                      start: .init(timeIntervalSince1970: 1662296400),
                      end: .init(timeIntervalSince1970: 1662303600),
                      weather: nil)
            ])
        ]
    }

    static var mockFormula1EventWithWeather: Event {
        .init(serie: .formula1, id: "14/2022", name: "Belgian GP", location: .init(latitude: 50.43706209479741, longitude: 5.972103651037462), sessions: [
            .init(name: "FP1",
                  type: .practice,
                  start: .init(timeIntervalSince1970: 1661515200),
                  end: .init(timeIntervalSince1970: 1661518800),
                  weather: .init(type: .overcast, temperature: 0, chanceOfRain: 0)),
            .init(name: "FP2",
                  type: .practice,
                  start: .init(timeIntervalSince1970: 1661526000),
                  end: .init(timeIntervalSince1970: 1661529600),
                  weather: .init(type: .sunny, temperature: 0, chanceOfRain: 0)),
            .init(name: "FP3",
                  type: .practice,
                  start: .init(timeIntervalSince1970: 1661598000),
                  end: .init(timeIntervalSince1970: 1661601600),
                  weather: .init(type: .cloudy, temperature: 0, chanceOfRain: 0)),
            .init(name: "Qualifying",
                  type: .qualifying,
                  start: .init(timeIntervalSince1970: 1661608800),
                  end: .init(timeIntervalSince1970: 1661612400),
                  weather: .init(type: .overcast, temperature: 23, chanceOfRain: 30)),
            .init(name: "Race",
                  type: .race,
                  start: .init(timeIntervalSince1970: 1661691600),
                  end: .init(timeIntervalSince1970: 1661698800),
                  weather: .init(type: .raining, temperature: 19, chanceOfRain: 90))
        ])
    }
}
