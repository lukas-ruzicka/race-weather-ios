//
//  GetForecastForEventTests.swift
//  
//
//  Created by Lukas Ruzicka on 20.10.2022.
//

@testable import DomainLayer
@testable import Utils
import XCTest

final class GetForecastForEventTests: XCTestCase {

    override func setUp() {
        Resolver.registerDomainLayer()
    }

    func testDetailedForecast() async throws {
        Resolver.register(WeatherRepository.self) { MockWeatherRepositoryDetailed() }
        let event = Event(serie: .formula1, id: "", name: "", countryCode: "",
                          trackName: "", trackMapUrl: nil, location: .init(),
                          sessions: [.inFuture])
        let useCase = Resolver.resolve(GetForecastForEvent.self)
        let eventWithForecast = try await useCase.use(event: event)

        XCTAssertNil(eventWithForecast?.dailyForecast)
        XCTAssertNotNil(eventWithForecast?.sessionDetails)
    }

    func testHourlyForecast() async throws {
        Resolver.register(WeatherRepository.self) { MockWeatherRepositoryHourly() }
        let event = Event(serie: .formula1, id: "", name: "", countryCode: "",
                          trackName: "", trackMapUrl: nil, location: .init(),
                          sessions: [.inFuture])
        let useCase = Resolver.resolve(GetForecastForEvent.self)
        let eventWithForecast = try await useCase.use(event: event)

        XCTAssertNil(eventWithForecast?.dailyForecast)
        XCTAssertNotNil(eventWithForecast?.sessionDetails)
    }

    func testDailyForecast() async throws {
        Resolver.register(WeatherRepository.self) { MockWeatherRepositoryDaily() }
        let event = Event(serie: .formula1, id: "", name: "", countryCode: "",
                          trackName: "", trackMapUrl: nil, location: .init(),
                          sessions: [.inFuture])
        let useCase = Resolver.resolve(GetForecastForEvent.self)
        let eventWithForecast = try await useCase.use(event: event)

        XCTAssertNotNil(eventWithForecast?.dailyForecast)
        XCTAssertNil(eventWithForecast?.sessionDetails)
    }
}
