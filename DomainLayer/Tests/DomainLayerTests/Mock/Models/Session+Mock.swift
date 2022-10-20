//
//  Session+Mock.swift
//  
//
//  Created by Lukas Ruzicka on 20.10.2022.
//

import DomainLayer
import Foundation

extension Session {

    static var inFuture: Session {
        .init(
            id: "1", type: .race,
            dateRange: fiveMinutesInFuture...tenMinutesInFuture
        )
    }

    static var live: Session {
        .init(
            id: "0", type: .race,
            dateRange: fiveMinutesAgo...fiveMinutesInFuture
        )
    }

    static var finished: Session {
        .init(
            id: "-1", type: .race,
            dateRange: tenMinutesAgo...fiveMinutesAgo
        )
    }

    private static var tenMinutesAgo: Date { Calendar.current.date(byAdding: .minute, value: -10, to: .now)! }
    private static var fiveMinutesAgo: Date { Calendar.current.date(byAdding: .minute, value: -5, to: .now)! }
    private static var fiveMinutesInFuture: Date { Calendar.current.date(byAdding: .minute, value: 5, to: .now)! }
    private static var tenMinutesInFuture: Date { Calendar.current.date(byAdding: .minute, value: 10, to: .now)! }
}
