//
//  Event+Mock.swift
//  
//
//  Created by Lukáš Růžička on 13.08.2022.
//

public extension Event {

    static var mockFormula1BelgianGP: Event {
        .init(serie: .formula1,
              id: "14/2022",
              name: "Belgian GP",
              countryCode: "BE",
              trackName: "Spa",
              location: .init(latitude: 50.43706209479741, longitude: 5.972103651037462),
              sessions: [.mockFP1, .mockFP2, .mockFP3, .mockQualifying, .mockRace])
    }

    static var mockFormula1DutchGP: Event {
        .init(serie: .formula1,
              id: "15/2022",
              name: "Dutch GP",
              countryCode: "NL",
              trackName: "Zandvoort",
              location: .init(latitude: 52.388930678559184, longitude: 4.545441310492251),
              sessions: [.mockRaceDutch])
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
              location: .init(latitude: 50.43706209479741, longitude: 5.972103651037462),
              sessions: [.mockFP1, .mockFP2, .mockFP3, .mockQualifying, .mockRace])
    }

    static var mockMotoGPCzechGP: Event {
        .init(serie: .motogp,
              id: "15/2022",
              name: "Czech GP",
              countryCode: "CZ",
              trackName: "Brno",
              location: .init(latitude: 52.388930678559184, longitude: 4.545441310492251),
              sessions: [.mockRaceDutch])
    }

    static var mockMotoGPEvents: [Event] {
        [.mockMotoGPSpanishGP, .mockMotoGPCzechGP]
    }
}
