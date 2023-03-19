//
//  MotoTimingEventOverviewResponseModel.swift
//  
//
//  Created by Lukas Ruzicka on 28.10.2022.
//

struct MotoTimingEventOverviewResponseModel: Decodable {

    let calendar: [Event]

    struct Event: Decodable {

        let name: String
        let start_date: String
        let end_date: String
        let test: Int
    }
}
