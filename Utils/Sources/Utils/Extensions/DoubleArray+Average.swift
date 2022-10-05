//
//  DoubleArray+Average.swift
//  
//
//  Created by Lukas Ruzicka on 12.10.2022.
//

public extension Array where Element == Double {

    var average: Double {
        guard !isEmpty else { return 0 }
        let sum = reduce(0, +)
        return sum / Double(count)
    }
}
