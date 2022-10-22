//
//  Date+InitFromErgastResponse.swift
//  
//
//  Created by Lukas Ruzicka on 28.10.2022.
//

import Foundation

extension Date {

    init?(from responseModel: ErgastEventResponseModel.MRData.RaceTable.Race.Session) {
        let dateString = responseModel.date + "T" + responseModel.time
        guard let date = Date(string: dateString) else { return nil }

        self = date
    }

    init?(from responseModel: ErgastEventResponseModel.MRData.RaceTable.Race) {
        let dateString = responseModel.date + "T" + responseModel.time
        guard let date = Date(string: dateString) else { return nil }

        self = date
    }
}
