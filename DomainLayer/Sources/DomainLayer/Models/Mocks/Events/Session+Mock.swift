//
//  Session+Mock.swift
//  
//
//  Created by Lukáš Růžička on 13.08.2022.
//

import Foundation

public extension Session {

    static var mockFP1: Session {
        .init(id: "14/2022/FP1", name: "FP1",
              dateRange: .init(timeIntervalSince1970: 1661515200)...Date(timeIntervalSince1970: 1661518800))
    }

    static var mockFP2: Session {
        .init(id: "14/2022/FP2", name: "FP2",
              dateRange: .init(timeIntervalSince1970: 1661526000)...Date(timeIntervalSince1970: 1661529600))
    }

    static var mockFP3: Session {
        .init(id: "14/2022/FP3", name: "FP3",
              dateRange: .init(timeIntervalSince1970: 1661598000)...Date(timeIntervalSince1970: 1661601600))
    }

    static var mockQualifying: Session {
        .init(id: "14/2022/Qualifying", name: "Qualifying",
              dateRange: .init(timeIntervalSince1970: 1661608800)...Date(timeIntervalSince1970: 1661612400))
    }

    static var mockRace: Session {
        .init(id: "14/2022/Race", name: "Race",
              dateRange: .init(timeIntervalSince1970: 1661691600)...Date(timeIntervalSince1970: 1661698800))
    }

    static var mockRaceDutch: Session {
        .init(id: "15/2022/Race", name: "Race",
              dateRange: .init(timeIntervalSince1970: 1662296400)...Date(timeIntervalSince1970: 1662303600))
    }
}
