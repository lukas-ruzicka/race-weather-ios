//
//  RuntimeCache.swift
//  
//
//  Created by Lukas Ruzicka on 26.10.2022.
//

import Foundation

protocol RuntimeCache {

    func get<T>(_ key: RuntimeCacheKey) -> T?
    func cache<T>(_ object: T, for key: RuntimeCacheKey, validity: TimeInterval)
    func clear(_ key: RuntimeCacheKey)
    func clearAll()
}

enum RuntimeCacheKey: String {

    case formula1Events
}
