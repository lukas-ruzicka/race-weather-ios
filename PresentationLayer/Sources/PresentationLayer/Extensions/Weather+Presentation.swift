//
//  Weather+Presentation.swift
//  
//
//  Created by Lukáš Růžička on 14.08.2022.
//

import DomainLayer
import SwiftUI

extension Weather {

    @ViewBuilder
    var icon: some View {
        if let sfSymbolName = sfSymbolName {
            Image(systemName: sfSymbolName)
        } else {
            type.icon
        }
    }
}
