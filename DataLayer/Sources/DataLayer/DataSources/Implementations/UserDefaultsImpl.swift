//
//  UserDefaultsImpl.swift
//  
//
//  Created by Lukas Ruzicka on 21.10.2022.
//

import Foundation

final class UserDefaultsImpl {

    // MARK: - Properties
    private let userDefaults = UserDefaults.standard
}

// MARK: - Protocol conformance
extension UserDefaultsImpl: KeyValueStorage {

    func get<T: Decodable>(_ key: Key) throws -> T? {
        guard let data = userDefaults.data(forKey: key.rawValue) else { return nil }
        return try JSONDecoder().decode(T.self, from: data)
    }

    func set<T: Encodable>(_ value: T, for key: Key) throws {
        let encoded = try JSONEncoder().encode(value)
        userDefaults.set(encoded, forKey: key.rawValue)
    }

    func remove(_ key: Key) {
        userDefaults.removeObject(forKey: key.rawValue)
    }

    func clearStorage() {
        userDefaults.dictionaryRepresentation().map(\.key).forEach {
            userDefaults.removeObject(forKey: $0)
        }
    }
}
