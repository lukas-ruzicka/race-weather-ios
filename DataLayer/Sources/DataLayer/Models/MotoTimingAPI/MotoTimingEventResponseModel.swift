//
//  MotoTimingEventResponseModel.swift
//  
//
//  Created by Lukas Ruzicka on 28.10.2022.
//

import Foundation

struct MotoTimingEventResponseModel: Decodable {

    let name: String
    let circuit: String
    let country_code: String
    let start_date: String
    let test: Int
    let sessions_grouped_by_date: SessionsGroupedByDate

    struct SessionsGroupedByDate: Decodable {

        let utc: [SessionGroup]

        struct SessionGroup: Decodable {

            let sessions: [Session]

            struct Session: Decodable {

                let start_datetime_utc: String
                let end_datetime_utc: String?
                let _class: String
                let session_short_name: String

                enum CodingKeys: String, CodingKey {

                    case start_datetime_utc, end_datetime_utc, session_short_name
                    case _class = "class"
                }
            }
        }
    }
}
