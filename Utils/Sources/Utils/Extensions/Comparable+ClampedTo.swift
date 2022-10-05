//
//  Comparable+ClampedTo.swift
//  
//
//  Created by Lukas Ruzicka on 12.10.2022.
//

import Foundation

public extension Comparable {

    /// Returns the value if its in the given range or one of bound values if its out of the range.
    /// - Parameter limits: The range in which the value should remain.
    /// - Returns: Modified value.
    func clamped(to limits: ClosedRange<Self>) -> Self {
        min(max(self, limits.lowerBound), limits.upperBound)
    }
}
