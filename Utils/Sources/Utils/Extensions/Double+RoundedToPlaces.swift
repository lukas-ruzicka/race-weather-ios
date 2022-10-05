//
//  Double+RoundedToPlaces.swift
//  
//
//  Created by Lukas Ruzicka on 29.10.2022.
//

import Foundation

public extension Double {

    func rounded(to decimalPlaces: Int) -> Double {
        let divisor = pow(10, Double(decimalPlaces))
        return (self * divisor).rounded() / divisor
    }
}
