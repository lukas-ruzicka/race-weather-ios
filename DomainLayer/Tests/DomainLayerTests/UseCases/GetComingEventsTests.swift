//
//  GetComingEventsTests.swift
//  
//
//  Created by Lukas Ruzicka on 20.10.2022.
//

@testable import DomainLayer
@testable import Utils
import XCTest

final class GetComingEventsTests: XCTestCase {

    override func setUp() {
        Resolver.registerDomainLayer()
        Resolver.register(EventsRepository.self) { (_, args) in
            switch args.get() as Serie {
            case .formula1:
                return MockFormula1EventsRepository()
            case .motogp:
                return MockMotoGPEventsRepository()
            }
        }
        .scope(.unique)
    }

    func testAllSeries() async throws {
        Resolver.register(SeriesRepository.self) { MockSeriesRepositoryAll() }
        let useCase = Resolver.resolve(GetComingEvents.self)
        let events = try await useCase.use()
        XCTAssertEqual(events.map(\.serie), [.formula1, .motogp])
    }

    func testJustF1() async throws {
        Resolver.register(SeriesRepository.self) { MockSeriesRepositoryJustF1() }
        let useCase = Resolver.resolve(GetComingEvents.self)
        let events = try await useCase.use()
        XCTAssertEqual(events.map(\.serie), [.formula1])
    }

    func testNoSeries() async throws {
        Resolver.register(SeriesRepository.self) { MockSeriesRepositoryNone() }
        let useCase = Resolver.resolve(GetComingEvents.self)
        let events = try await useCase.use()
        XCTAssertTrue(events.isEmpty)
    }
}
