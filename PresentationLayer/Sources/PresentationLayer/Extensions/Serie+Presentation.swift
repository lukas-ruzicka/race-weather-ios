//
//  Serie+Presentation.swift
//  
//
//  Created by Lukas Ruzicka on 13.08.2022.
//

import DomainLayer
import SwiftUI

extension Serie {

    var name: String {
        switch self {
        case .formula1:
            return L10n.Serie.formula1String
        case .motogp:
            return L10n.Serie.motoGpString
        }
    }

    var icon: Image {
        switch self {
        case .formula1:
            return .Series.formula1
        case .motogp:
            return .Series.motoGP
        }
    }
}
