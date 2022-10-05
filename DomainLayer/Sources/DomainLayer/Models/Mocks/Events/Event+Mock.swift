//
//  Event+Mock.swift
//  
//
//  Created by Lukas Ruzicka on 13.08.2022.
//

import Foundation

public extension Event {

    static var mockFormula1BelgianGP: Event {
        .init(serie: .formula1,
              id: "14/2022",
              name: "Belgian GP",
              countryCode: "BE",
              trackName: "Spa",
              trackMapUrl: URL(string: "https://openclipart.org/image/800px/291815"),
              location: .init(latitude: 50.43706209479741, longitude: 5.972103651037462),
              sessions: [.mockFP1, .mockFP2, .mockFP3, .mockQualifying, .mockRace])
    }

    static var mockFormula1DutchGP: Event {
        .init(serie: .formula1,
              id: "15/2022",
              name: "Dutch GP",
              countryCode: "NL",
              trackName: "Zandvoort",
              trackMapUrl: URL(string: "https://en.gpvwc.com/wiki/images/9/9a/Circuit_Park_Zandvoort.png"),
              location: .init(latitude: 52.388930678559184, longitude: 4.545441310492251),
              sessions: [.mockQualifying2NextWeekend, .mockSprintNextWeekend, .mockWarmupNextWeekend, .mockRaceNextWeekend])
    }

    static var mockFormula1Events: [Event] {
        [.mockFormula1BelgianGP, .mockFormula1DutchGP]
    }

    static var mockMotoGPSpanishGP: Event {
        .init(serie: .motogp,
              id: "14/2022",
              name: "Spanish GP",
              countryCode: "ES",
              trackName: "Barcelona",
              trackMapUrl: URL(string: "https://openclipart.org/image/800px/291822"),
              location: .init(latitude: 50.43706209479741, longitude: 5.972103651037462),
              sessions: [.mockFP1, .mockFP2, .mockFP3, .mockQualifying, .mockRace])
    }

    static var mockMotoGPCzechGP: Event {
        .init(serie: .motogp,
              id: "15/2022",
              name: "Czech GP",
              countryCode: "CZ",
              trackName: "Brno",
              trackMapUrl: URL(string: "https://www.mpadeco.com/resize/500x500/zc/3/f/0/src/sites/mpadeco/files/products/2effd1cbdfbe9fea056522acd0451c29.png"),
              location: .init(latitude: 52.388930678559184, longitude: 4.545441310492251),
              sessions: [.mockQualifying2NextWeekend, .mockSprintNextWeekend, .mockWarmupNextWeekend, .mockRaceNextWeekend])
    }

    static var mockMotoGPEvents: [Event] {
        [.mockMotoGPSpanishGP, .mockMotoGPCzechGP]
    }
}
