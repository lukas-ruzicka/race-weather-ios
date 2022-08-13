//
//  View+FrameSize.swift
//  
//
//  Created by Lukáš Růžička on 13.08.2022.
//

import SwiftUI

extension View {

    func frame(size: CGFloat) -> some View {
        frame(width: size, height: size)
    }
}
