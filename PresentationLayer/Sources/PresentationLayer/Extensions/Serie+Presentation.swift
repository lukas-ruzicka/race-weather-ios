//
//  Serie+Presentation.swift
//  
//
//  Created by Lukáš Růžička on 13.08.2022.
//

import DomainLayer
import SwiftUI

extension Serie {

    var name: String {
        switch self {
        case .formula1:
            return "Formula 1"
        case .motogp:
            return "MotoGP"
        }
    }

    var icon: Image {
        switch self {
        case .formula1:
            return Image("Series/formula1")
        case .motogp:
            return Image("Series/motoGP")
        }
    }
}
