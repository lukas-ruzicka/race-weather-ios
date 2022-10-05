//
//  Session+Mock.swift
//  
//
//  Created by Lukas Ruzicka on 13.08.2022.
//

import Foundation

public extension Session {

    static var mockFP1: Session {
        .init(id: "14/2022/FP1", type: .practice(number: 1),
              dateRange: .thisWeeks(.friday, at: 12)...Date.thisWeeks(.friday, at: 13))
    }

    static var mockFP2: Session {
        .init(id: "14/2022/FP2", type: .practice(number: 2),
              dateRange: .thisWeeks(.friday, at: 15)...Date.thisWeeks(.friday, at: 16))
    }

    static var mockFP3: Session {
        .init(id: "14/2022/FP3", type: .practice(number: 3),
              dateRange: .thisWeeks(.saturday, at: 12)...Date.thisWeeks(.saturday, at: 13))
    }

    static var mockQualifying: Session {
        .init(id: "14/2022/Qualifying", type: .qualifying(),
              dateRange: .thisWeeks(.saturday, at: 14)...Date.thisWeeks(.saturday, at: 15))
    }

    static var mockRace: Session {
        .init(id: "14/2022/Race", type: .race,
              dateRange: .thisWeeks(.sunday, at: 14)...Date.thisWeeks(.sunday, at: 16))
    }

    static var mockQualifying2NextWeekend: Session {
        .init(id: "15/2022/Q2", type: .qualifying(number: 2),
              dateRange: .nextWeeks(.saturday, at: 15)...Date.nextWeeks(.saturday, at: 16))
    }

    static var mockSprintNextWeekend: Session {
        .init(id: "15/2022/Sprint", type: .sprint,
              dateRange: .nextWeeks(.saturday, at: 17)...Date.nextWeeks(.saturday, at: 18))
    }

    static var mockWarmupNextWeekend: Session {
        .init(id: "15/2022/Warmup", type: .warmup,
              dateRange: .nextWeeks(.sunday, at: 10)...Date.nextWeeks(.sunday, at: 11))
    }

    static var mockRaceNextWeekend: Session {
        .init(id: "15/2022/Race", type: .race,
              dateRange: .nextWeeks(.sunday, at: 14)...Date.nextWeeks(.sunday, at: 16))
    }
}
