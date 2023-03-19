//
//  Session+InitFromMotoTimingResponse.swift
//  
//
//  Created by Lukas Ruzicka on 28.10.2022.
//

import DomainLayer
import Foundation

extension Session {

    init?(from responseModel: MotoTimingEventResponseModel.SessionsGroupedByDate.SessionGroup.Session, eventId: String) {
        guard let sessionType = SessionType(from: responseModel.session_short_name),
              let start = Date(string: responseModel.start_datetime_utc),
              let end = Date(string:  responseModel.end_datetime_utc ?? "")
                ?? Calendar(identifier: .gregorian).date(byAdding: .hour, value: 2, to: start) else { return nil }

        self.init(
            id: eventId + "_" + responseModel.session_short_name,
            type: sessionType,
            dateRange: start...end
        )
    }
}

// MARK: - Session type resolving
private extension SessionType {

    init?(from motoTimingShortName: String) {
        if motoTimingShortName.starts(with: "P"),
            let number = Int(motoTimingShortName.replacingOccurrences(of: "P", with: "")) {
            self = .practice(number: number)
            return
        }
        if motoTimingShortName.starts(with: "Q"),
            let number = Int(motoTimingShortName.replacingOccurrences(of: "Q", with: "")) {
            self = .qualifying(number: number)
            return
        }
        switch motoTimingShortName {
        case "WUP":
            self = .warmup
        case "RAC":
            self = .race
        default:
            return nil
        }
    }
}
