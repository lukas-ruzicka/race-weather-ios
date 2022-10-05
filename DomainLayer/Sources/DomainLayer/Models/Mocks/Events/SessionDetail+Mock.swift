//
//  SessionDetail+Mock.swift
//  
//
//  Created by Lukas Ruzicka on 14.08.2022.
//

public extension SessionDetail {

    static var mockFP1: SessionDetail {
        .init(id: Session.mockFP1.id,
              event: .mockFormula1BelgianGP,
              type: Session.mockFP1.type,
              dateRange: Session.mockFP1.dateRange,
              forecast: [.init(date: Session.mockFP1.dateRange.lowerBound, weather: .mockOvercast)])
    }

    static var mockFP2: SessionDetail {
        .init(id: Session.mockFP2.id,
              event: .mockFormula1BelgianGP,
              type: Session.mockFP2.type,
              dateRange: Session.mockFP2.dateRange,
              forecast: [.init(date: Session.mockFP2.dateRange.lowerBound, weather: .mockSunny)])
    }

    static var mockFP3: SessionDetail {
        .init(id: Session.mockFP3.id,
              event: .mockFormula1BelgianGP,
              type: Session.mockFP3.type,
              dateRange: Session.mockFP3.dateRange,
              forecast: [.init(date: Session.mockFP3.dateRange.lowerBound, weather: .mockHeavyRain)])
    }

    static var mockQualifying: SessionDetail {
        .init(id: Session.mockQualifying.id,
              event: .mockFormula1BelgianGP,
              type: Session.mockQualifying.type,
              dateRange: Session.mockQualifying.dateRange,
              forecast: [.init(date: Session.mockQualifying.dateRange.lowerBound, weather: .mockLightRain)])
    }

    static var mockRace: SessionDetail {
        .init(id: Session.mockRace.id,
              event: .mockFormula1BelgianGP,
              type: Session.mockRace.type,
              dateRange: Session.mockRace.dateRange,
              forecast: [
                .init(date: Session.mockRace.dateRange.lowerBound, weather: .mockRandom),
                .init(date: Session.mockRace.dateRange.lowerBound.addingTimeInterval(60 * 60), weather: .mockRandom),
              ])
    }

    static var mockWholeWeekend: [SessionDetail] {
        [.mockFP1, .mockFP2, .mockFP3, .mockQualifying, .mockRace]
    }
}
