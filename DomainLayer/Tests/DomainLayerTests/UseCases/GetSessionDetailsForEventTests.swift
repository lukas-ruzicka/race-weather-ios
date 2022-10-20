//
//  GetSessionDetailsForEventTests.swift
//  
//
//  Created by Lukas Ruzicka on 20.10.2022.
//

@testable import DomainLayer
@testable import Utils
import XCTest

final class GetSessionDetailsForEventTests: XCTestCase {

    override func setUp() {
        Resolver.registerDomainLayer()
        Resolver.register(WeatherRepository.self) { MockWeatherRepositoryDetailed() }
    }

    func testForecastObtaining() async throws {
        let event = Event(serie: .formula1, id: "", name: "", countryCode: "",
                          trackName: "", trackMapUrl: nil, location: .init(),
                          sessions: [.finished, .live, .inFuture])
        let useCase = Resolver.resolve(GetSessionDetailsForEvent.self)
        let sessionsDetails = try await useCase.use(event: event)

        for sessionDetail in sessionsDetails {
            if sessionDetail.id == "-1" {
                XCTAssertNil(sessionDetail.forecast)
            } else {
                XCTAssertNotNil(sessionDetail.forecast)
            }
        }
    }
}
