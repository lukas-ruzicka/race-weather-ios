//
//  Date+InitFromResponse.swift
//  
//
//  Created by Lukas Ruzicka on 22.10.2022.
//

import Foundation

extension Date {

    init?(string: String) {
        guard let date = ISO8601DateFormatter().date(from: string) else { return nil }

        self = date
    }
}
