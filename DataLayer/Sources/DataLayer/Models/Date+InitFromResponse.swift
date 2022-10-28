//
//  Date+InitFromResponse.swift
//  
//
//  Created by Lukas Ruzicka on 22.10.2022.
//

import Foundation

extension Date {

    init?(string: String) {
        let formatter = ISO8601DateFormatter()
        if let date = formatter.date(from: string) {
            self = date
            return
        }
        formatter.formatOptions = [.withInternetDateTime, .withFractionalSeconds]
        if let date = formatter.date(from: string) {
            self = date
            return
        }
        return nil
    }
}
