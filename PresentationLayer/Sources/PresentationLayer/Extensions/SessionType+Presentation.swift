//
//  SessionType+Presentation.swift
//  
//
//  Created by Lukas Ruzicka on 22.10.2022.
//

import DomainLayer
import SwiftUI

extension SessionType {

    var name: Text {
        switch self {
        case .practice(let number):
            return Text(L10n.Session.practiceString + " \(number)")
        case .qualifying(let number):
            if let number {
                return Text(L10n.Session.qualifyingString + " \(number)")
            }
            return L10n.Session.qualifying
        case .sprint:
            return L10n.Session.sprint
        case .warmup:
            return L10n.Session.warmup
        case .race:
            return L10n.Session.race
        }
    }
}
