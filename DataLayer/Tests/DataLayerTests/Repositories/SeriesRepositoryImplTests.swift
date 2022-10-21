//
//  SeriesRepositoryImplTests.swift
//  
//
//  Created by Lukas Ruzicka on 21.10.2022.
//

@testable import DomainLayer
@testable import DataLayer
@testable import Utils
import XCTest

final class SeriesRepositoryImplTests: XCTestCase {

    override func setUp() {
        Resolver.registerDataLayer()
        Resolver.resolve(KeyValueStorage.self).clearStorage()
    }

    func testRuntimePersistence() {
        let repository = Resolver.resolve(SeriesRepository.self)

        XCTAssertEqual(repository.getAvailable(), repository.getAll())

        repository.setAvailable([.formula1])
        XCTAssertEqual(repository.getAvailable(), [.formula1])
        XCTAssertNotEqual(repository.getAvailable(), repository.getAll())

        repository.setAvailable([])
        XCTAssertEqual(repository.getAvailable(), [])
        XCTAssertNotEqual(repository.getAvailable(), repository.getAll())
    }

    func testPersistence() {
        Resolver.register(KeyValueStorage.self) { UserDefaultsImpl() }
            .scope(.unique)

        let repository = Resolver.resolve(SeriesRepository.self)
        repository.setAvailable([.formula1])
        XCTAssertEqual(repository.getAvailable(), [.formula1])

        let newRepository = Resolver.resolve(SeriesRepository.self)
        XCTAssertEqual(newRepository.getAvailable(), [.formula1])
    }
}
