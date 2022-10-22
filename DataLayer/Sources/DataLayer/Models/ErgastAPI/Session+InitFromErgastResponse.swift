//
//  Session+InitFromErgastResponse.swift
//  
//
//  Created by Lukas Ruzicka on 22.10.2022.
//

import DomainLayer
import Foundation

extension Session {

    init?(from responseModel: ErgastEventResponseModel.MRData.RaceTable.Race.Session?, type: SessionType, eventId: String) {
        guard let responseModel,
              let start = Date(from: responseModel),
              let end = Calendar(identifier: .gregorian).date(byAdding: .hour, value: type.hourLength, to: start) else { return nil }

        self.init(
            id: eventId + "_" + type.id,
            type: type,
            dateRange: start...end
        )
    }

    init?(from responseModel: ErgastEventResponseModel.MRData.RaceTable.Race, eventId: String) {
        let type = SessionType.race
        guard let start = Date(from: responseModel),
              let end = Calendar(identifier: .gregorian).date(byAdding: .hour, value: type.hourLength, to: start) else { return nil }

        self.init(
            id: eventId + "_" + type.id,
            type: type,
            dateRange: start...end
        )
    }
}

extension SessionType {

    var id: String {
        switch self {
        case .practice(let number):
            return "practice\(number)"
        case .qualifying:
            return "qualifying"
        case .sprint:
            return "sprint"
        case .warmup:
            return "warmup"
        case .race:
            return "race"
        }
    }

    var hourLength: Int {
        switch self {
        case .practice, .qualifying, .sprint, .warmup:
            return 1
        case .race:
            return 2
        }
    }
}
