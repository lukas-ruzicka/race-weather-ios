//
//  Event+MainDate.swift
//  
//
//  Created by Lukáš Růžička on 03.08.2022.
//

import DomainLayer
import Foundation

extension Event {

    var mainDate: Date? {
        sessions.last?.dateRange.lowerBound
    }
}
