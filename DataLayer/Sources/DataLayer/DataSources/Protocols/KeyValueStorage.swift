//
//  KeyValueStorage.swift
//  
//
//  Created by Lukas Ruzicka on 21.10.2022.
//

protocol KeyValueStorage {

    typealias Key = KeyValueStorageKey

    func get<T: Decodable>(_ key: Key) throws -> T?
    func set<T: Encodable>(_ value: T, for key: Key) throws
    func remove(_ key: Key)
    func clearStorage()
}

enum KeyValueStorageKey: String {

    case availableSeries
}
