//
//  RuntimeCacheImpl.swift
//  
//
//  Created by Lukas Ruzicka on 26.10.2022.
//

import Foundation

final class RuntimeCacheImpl {

    // MARK: - Subtypes
    struct Cached {

        let value: Any
        let timeout: Date
    }

    // MARK: - Properties
    private var cache: [RuntimeCacheKey: Cached] = [:]
}

// MARK: - Protocol conformance
extension RuntimeCacheImpl: RuntimeCache {

    func get<T>(_ key: RuntimeCacheKey) -> T? {
        guard let cached = cache[key] else { return nil }
        guard cached.timeout > Date() else {
            clear(key)
            return nil
        }
        return cached.value as? T
    }

    func cache<T>(_ object: T, for key: RuntimeCacheKey, validity: TimeInterval) {
        cache[key] = .init(value: object, timeout: Date().addingTimeInterval(validity))
    }

    func clear(_ key: RuntimeCacheKey) {
        cache.removeValue(forKey: key)
    }

    func clearAll() {
        cache = [:]
    }
}
