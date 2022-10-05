//
//  SessionType.swift
//  
//
//  Created by Lukas Ruzicka on 22.10.2022.
//

public enum SessionType: Hashable {

    case practice(number: Int)
    case qualifying(number: Int? = nil)
    case sprint
    case warmup
    case race
}
