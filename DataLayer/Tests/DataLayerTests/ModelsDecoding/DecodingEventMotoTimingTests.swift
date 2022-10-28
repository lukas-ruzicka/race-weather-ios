//
//  DecodingEventMotoTimingTests.swift
//  
//
//  Created by Lukas Ruzicka on 28.10.2022.
//

@testable import DomainLayer
@testable import DataLayer
import Foundation
import XCTest

final class DecodingEventMotoTimingTests: XCTestCase {

    func testQatar() throws {
        let jsonData = try XCTUnwrap(qatarResponse.data(using: .utf8))
        let responseModel = try JSONDecoder().decode(MotoTimingEventResponseModel.self, from: jsonData)
        let event = try XCTUnwrap(Event(from: responseModel, serie: .motogp))

        XCTAssertEqual(event.serie, .motogp)
        XCTAssertEqual(event.id, "motogp_2022_Grand_Prix_of_Qatar")
        XCTAssertEqual(event.name, "GP of Qatar")
        XCTAssertEqual(event.countryCode, "QA")
        XCTAssertEqual(event.trackName, "Lusail International Circuit")
        XCTAssertEqual(event.trackMapUrl?.absoluteString, "https://www.yamahamotogp.com/showImg/16_circuiti/1147037330.png")
        XCTAssertEqual(event.location.coordinate.latitude, 25.486882818831937)
        XCTAssertEqual(event.location.coordinate.longitude, 51.454617241245920)
        XCTAssertEqual(event.sessions.count, 8)
        let fp1 = event.sessions[0]
        XCTAssertEqual(fp1.id, "motogp_2022_Grand_Prix_of_Qatar_FP1")
        XCTAssertEqual(fp1.type, .practice(number: 1))
        XCTAssertEqual(fp1.dateRange, Date(string: "2022-03-04T10:40:00Z")!...Date(string: "2022-03-04T11:25:00Z")!)
        let q1 = event.sessions[4]
        XCTAssertEqual(q1.id, "motogp_2022_Grand_Prix_of_Qatar_Q1")
        XCTAssertEqual(q1.type, .qualifying(number: 1))
        XCTAssertEqual(q1.dateRange, Date(string: "2022-03-05T15:00:00Z")!...Date(string: "2022-03-05T15:15:00Z")!)
        let race = event.sessions[7]
        XCTAssertEqual(race.id, "motogp_2022_Grand_Prix_of_Qatar_RAC")
        XCTAssertEqual(race.type, .race)
        XCTAssertEqual(race.dateRange, Date(string: "2022-03-06T15:00:00Z")!...Date(string: "2022-03-06T17:00:00Z")!)
    }

    func testValencia() throws {
        let jsonData = try XCTUnwrap(valenciaResponse.data(using: .utf8))
        let responseModel = try JSONDecoder().decode(MotoTimingEventResponseModel.self, from: jsonData)
        let event = try XCTUnwrap(Event(from: responseModel, serie: .motogp))

        XCTAssertEqual(event.serie, .motogp)
        XCTAssertEqual(event.id, "motogp_2022_Gran_Premio_Motul_de_la_Comunitat_Valenciana")
        XCTAssertEqual(event.name, "GP Motul de la Comunitat Valenciana")
        XCTAssertEqual(event.countryCode, "ES")
        XCTAssertEqual(event.trackName, "Circuit Ricardo Tormo")
        XCTAssertEqual(event.trackMapUrl?.absoluteString, "https://www.yamahamotogp.com/showImg/16_circuiti/659572185.png")
        XCTAssertEqual(event.location.coordinate.latitude, 39.48816050658184)
        XCTAssertEqual(event.location.coordinate.longitude, 0.6292142246673847)
        XCTAssertEqual(event.sessions.count, 8)
        let q2 = event.sessions[5]
        XCTAssertEqual(q2.id, "motogp_2022_Gran_Premio_Motul_de_la_Comunitat_Valenciana_Q2")
        XCTAssertEqual(q2.type, .qualifying(number: 2))
        XCTAssertEqual(q2.dateRange, Date(string: "2022-11-05T13:35:00Z")!...Date(string: "2022-11-05T13:50:00Z")!)
        let warmup = event.sessions[6]
        XCTAssertEqual(warmup.id, "motogp_2022_Gran_Premio_Motul_de_la_Comunitat_Valenciana_WUP")
        XCTAssertEqual(warmup.type, .warmup)
        XCTAssertEqual(warmup.dateRange, Date(string: "2022-11-06T08:40:00Z")!...Date(string: "2022-11-06T09:00:00Z")!)
        let race = event.sessions[7]
        XCTAssertEqual(race.id, "motogp_2022_Gran_Premio_Motul_de_la_Comunitat_Valenciana_RAC")
        XCTAssertEqual(race.type, .race)
        XCTAssertEqual(race.dateRange, Date(string: "2022-11-06T13:00:00Z")!...Date(string: "2022-11-06T15:00:00Z")!)
    }
}

private extension DecodingEventMotoTimingTests {

    var qatarResponse: String {
        """
        {
            "name": "Grand Prix of Qatar",
            "circuit": "Lusail International Circuit",
            "country_code": "QA",
            "country": "Qatar",
            "start_date": "2022-03-04T00:00:00.000000Z",
            "end_date": "2022-03-06T00:00:00.000000Z",
            "local_tz_offset": 3,
            "test": 0,
            "dates": "04 Mar - 06 Mar",
            "sessions_grouped_by_date": {
                "utc": [
                    {
                        "start_datetime_utc": "2022-03-04T05:50:00+00:00",
                        "day_of_week": "Friday",
                        "sessions": [
                            {
                                "start_datetime_local": "2022-03-04T08:50:00+03:00",
                                "start_datetime_utc": "2022-03-04T05:50:00+00:00",
                                "end_datetime_local": "2022-03-04T09:30:00+03:00",
                                "end_datetime_utc": "2022-03-04T06:30:00+00:00",
                                "class": "Moto3",
                                "session_name": "Free Practice Nr. 1",
                                "session_short_name": "FP1"
                            },
                            {
                                "start_datetime_local": "2022-03-04T12:45:00+03:00",
                                "start_datetime_utc": "2022-03-04T09:45:00+00:00",
                                "end_datetime_local": "2022-03-04T13:25:00+03:00",
                                "end_datetime_utc": "2022-03-04T10:25:00+00:00",
                                "class": "Moto2",
                                "session_name": "Free Practice Nr. 1",
                                "session_short_name": "FP1"
                            },
                            {
                                "start_datetime_local": "2022-03-04T13:10:00+03:00",
                                "start_datetime_utc": "2022-03-04T10:10:00+00:00",
                                "end_datetime_local": "2022-03-04T13:50:00+03:00",
                                "end_datetime_utc": "2022-03-04T10:50:00+00:00",
                                "class": "Moto3",
                                "session_name": "Free Practice Nr. 2",
                                "session_short_name": "FP2"
                            },
                            {
                                "start_datetime_local": "2022-03-04T13:40:00+03:00",
                                "start_datetime_utc": "2022-03-04T10:40:00+00:00",
                                "end_datetime_local": "2022-03-04T14:25:00+03:00",
                                "end_datetime_utc": "2022-03-04T11:25:00+00:00",
                                "class": "MotoGP",
                                "session_name": "Free Practice Nr. 1",
                                "session_short_name": "FP1"
                            },
                            {
                                "start_datetime_local": "2022-03-04T17:05:00+03:00",
                                "start_datetime_utc": "2022-03-04T14:05:00+00:00",
                                "end_datetime_local": "2022-03-04T17:45:00+03:00",
                                "end_datetime_utc": "2022-03-04T14:45:00+00:00",
                                "class": "Moto2",
                                "session_name": "Free Practice Nr. 2",
                                "session_short_name": "FP2"
                            },
                            {
                                "start_datetime_local": "2022-03-04T18:00:00+03:00",
                                "start_datetime_utc": "2022-03-04T15:00:00+00:00",
                                "end_datetime_local": "2022-03-04T18:45:00+03:00",
                                "end_datetime_utc": "2022-03-04T15:45:00+00:00",
                                "class": "MotoGP",
                                "session_name": "Free Practice Nr. 2",
                                "session_short_name": "FP2"
                            }
                        ]
                    },
                    {
                        "start_datetime_utc": "2022-03-05T05:25:00+00:00",
                        "day_of_week": "Saturday",
                        "sessions": [
                            {
                                "start_datetime_local": "2022-03-05T08:25:00+03:00",
                                "start_datetime_utc": "2022-03-05T05:25:00+00:00",
                                "end_datetime_local": "2022-03-05T09:05:00+03:00",
                                "end_datetime_utc": "2022-03-05T06:05:00+00:00",
                                "class": "Moto3",
                                "session_name": "Free Practice Nr. 3",
                                "session_short_name": "FP3"
                            },
                            {
                                "start_datetime_local": "2022-03-05T12:20:00+03:00",
                                "start_datetime_utc": "2022-03-05T09:20:00+00:00",
                                "end_datetime_local": "2022-03-05T13:00:00+03:00",
                                "end_datetime_utc": "2022-03-05T10:00:00+00:00",
                                "class": "Moto2",
                                "session_name": "Free Practice Nr. 3",
                                "session_short_name": "FP3"
                            },
                            {
                                "start_datetime_local": "2022-03-05T12:30:00+03:00",
                                "start_datetime_utc": "2022-03-05T09:30:00+00:00",
                                "end_datetime_local": "2022-03-05T12:45:00+03:00",
                                "end_datetime_utc": "2022-03-05T09:45:00+00:00",
                                "class": "Moto3",
                                "session_name": "Qualifying Nr. 1 ",
                                "session_short_name": "Q1"
                            },
                            {
                                "start_datetime_local": "2022-03-05T12:55:00+03:00",
                                "start_datetime_utc": "2022-03-05T09:55:00+00:00",
                                "end_datetime_local": "2022-03-05T13:10:00+03:00",
                                "end_datetime_utc": "2022-03-05T10:10:00+00:00",
                                "class": "Moto3",
                                "session_name": "Qualifying Nr. 2 ",
                                "session_short_name": "Q2"
                            },
                            {
                                "start_datetime_local": "2022-03-05T13:15:00+03:00",
                                "start_datetime_utc": "2022-03-05T10:15:00+00:00",
                                "end_datetime_local": "2022-03-05T14:00:00+03:00",
                                "end_datetime_utc": "2022-03-05T11:00:00+00:00",
                                "class": "MotoGP",
                                "session_name": "Free Practice Nr. 3",
                                "session_short_name": "FP3"
                            },
                            {
                                "start_datetime_local": "2022-03-05T16:25:00+03:00",
                                "start_datetime_utc": "2022-03-05T13:25:00+00:00",
                                "end_datetime_local": "2022-03-05T16:40:00+03:00",
                                "end_datetime_utc": "2022-03-05T13:40:00+00:00",
                                "class": "Moto2",
                                "session_name": "Qualifying Nr. 1 ",
                                "session_short_name": "Q1"
                            },
                            {
                                "start_datetime_local": "2022-03-05T16:50:00+03:00",
                                "start_datetime_utc": "2022-03-05T13:50:00+00:00",
                                "end_datetime_local": "2022-03-05T17:05:00+03:00",
                                "end_datetime_utc": "2022-03-05T14:05:00+00:00",
                                "class": "Moto2",
                                "session_name": "Qualifying Nr. 2 ",
                                "session_short_name": "Q2"
                            },
                            {
                                "start_datetime_local": "2022-03-05T17:20:00+03:00",
                                "start_datetime_utc": "2022-03-05T14:20:00+00:00",
                                "end_datetime_local": "2022-03-05T17:50:00+03:00",
                                "end_datetime_utc": "2022-03-05T14:50:00+00:00",
                                "class": "MotoGP",
                                "session_name": "Free Practice Nr. 4",
                                "session_short_name": "FP4"
                            },
                            {
                                "start_datetime_local": "2022-03-05T18:00:00+03:00",
                                "start_datetime_utc": "2022-03-05T15:00:00+00:00",
                                "end_datetime_local": "2022-03-05T18:15:00+03:00",
                                "end_datetime_utc": "2022-03-05T15:15:00+00:00",
                                "class": "MotoGP",
                                "session_name": "Qualifying Nr. 1 ",
                                "session_short_name": "Q1"
                            },
                            {
                                "start_datetime_local": "2022-03-05T18:25:00+03:00",
                                "start_datetime_utc": "2022-03-05T15:25:00+00:00",
                                "end_datetime_local": "2022-03-05T18:40:00+03:00",
                                "end_datetime_utc": "2022-03-05T15:40:00+00:00",
                                "class": "MotoGP",
                                "session_name": "Qualifying Nr. 2 ",
                                "session_short_name": "Q2"
                            }
                        ]
                    },
                    {
                        "start_datetime_utc": "2022-03-06T07:00:00+00:00",
                        "day_of_week": "Sunday",
                        "sessions": [
                            {
                                "start_datetime_local": "2022-03-06T10:00:00+03:00",
                                "start_datetime_utc": "2022-03-06T07:00:00+00:00",
                                "end_datetime_local": "2022-03-06T10:10:00+03:00",
                                "end_datetime_utc": "2022-03-06T07:10:00+00:00",
                                "class": "Moto3",
                                "session_name": "Warm Up",
                                "session_short_name": "WUP"
                            },
                            {
                                "start_datetime_local": "2022-03-06T12:00:00+03:00",
                                "start_datetime_utc": "2022-03-06T09:00:00+00:00",
                                "class": "Moto3",
                                "session_name": "Race",
                                "session_short_name": "RAC"
                            },
                            {
                                "start_datetime_local": "2022-03-06T13:20:00+03:00",
                                "start_datetime_utc": "2022-03-06T10:20:00+00:00",
                                "end_datetime_local": "2022-03-06T13:30:00+03:00",
                                "end_datetime_utc": "2022-03-06T10:30:00+00:00",
                                "class": "Moto2",
                                "session_name": "Warm Up",
                                "session_short_name": "WUP"
                            },
                            {
                                "start_datetime_local": "2022-03-06T13:40:00+03:00",
                                "start_datetime_utc": "2022-03-06T10:40:00+00:00",
                                "end_datetime_local": "2022-03-06T14:00:00+03:00",
                                "end_datetime_utc": "2022-03-06T11:00:00+00:00",
                                "class": "MotoGP",
                                "session_name": "Warm Up",
                                "session_short_name": "WUP"
                            },
                            {
                                "start_datetime_local": "2022-03-06T16:20:00+03:00",
                                "start_datetime_utc": "2022-03-06T13:20:00+00:00",
                                "class": "Moto2",
                                "session_name": "Race",
                                "session_short_name": "RAC"
                            },
                            {
                                "start_datetime_local": "2022-03-06T18:00:00+03:00",
                                "start_datetime_utc": "2022-03-06T15:00:00+00:00",
                                "class": "MotoGP",
                                "session_name": "Race",
                                "session_short_name": "RAC"
                            }
                        ]
                    }
                ],
                "local": [
                    {
                        "start_datetime_utc": "2022-03-04T08:50:00+03:00",
                        "day_of_week": "Friday",
                        "sessions": [
                            {
                                "start_datetime_local": "2022-03-04T08:50:00+03:00",
                                "start_datetime_utc": "2022-03-04T05:50:00+00:00",
                                "end_datetime_local": "2022-03-04T09:30:00+03:00",
                                "end_datetime_utc": "2022-03-04T06:30:00+00:00",
                                "class": "Moto3",
                                "session_name": "Free Practice Nr. 1",
                                "session_short_name": "FP1"
                            },
                            {
                                "start_datetime_local": "2022-03-04T12:45:00+03:00",
                                "start_datetime_utc": "2022-03-04T09:45:00+00:00",
                                "end_datetime_local": "2022-03-04T13:25:00+03:00",
                                "end_datetime_utc": "2022-03-04T10:25:00+00:00",
                                "class": "Moto2",
                                "session_name": "Free Practice Nr. 1",
                                "session_short_name": "FP1"
                            },
                            {
                                "start_datetime_local": "2022-03-04T13:10:00+03:00",
                                "start_datetime_utc": "2022-03-04T10:10:00+00:00",
                                "end_datetime_local": "2022-03-04T13:50:00+03:00",
                                "end_datetime_utc": "2022-03-04T10:50:00+00:00",
                                "class": "Moto3",
                                "session_name": "Free Practice Nr. 2",
                                "session_short_name": "FP2"
                            },
                            {
                                "start_datetime_local": "2022-03-04T13:40:00+03:00",
                                "start_datetime_utc": "2022-03-04T10:40:00+00:00",
                                "end_datetime_local": "2022-03-04T14:25:00+03:00",
                                "end_datetime_utc": "2022-03-04T11:25:00+00:00",
                                "class": "MotoGP",
                                "session_name": "Free Practice Nr. 1",
                                "session_short_name": "FP1"
                            },
                            {
                                "start_datetime_local": "2022-03-04T17:05:00+03:00",
                                "start_datetime_utc": "2022-03-04T14:05:00+00:00",
                                "end_datetime_local": "2022-03-04T17:45:00+03:00",
                                "end_datetime_utc": "2022-03-04T14:45:00+00:00",
                                "class": "Moto2",
                                "session_name": "Free Practice Nr. 2",
                                "session_short_name": "FP2"
                            },
                            {
                                "start_datetime_local": "2022-03-04T18:00:00+03:00",
                                "start_datetime_utc": "2022-03-04T15:00:00+00:00",
                                "end_datetime_local": "2022-03-04T18:45:00+03:00",
                                "end_datetime_utc": "2022-03-04T15:45:00+00:00",
                                "class": "MotoGP",
                                "session_name": "Free Practice Nr. 2",
                                "session_short_name": "FP2"
                            }
                        ]
                    },
                    {
                        "start_datetime_utc": "2022-03-05T08:25:00+03:00",
                        "day_of_week": "Saturday",
                        "sessions": [
                            {
                                "start_datetime_local": "2022-03-05T08:25:00+03:00",
                                "start_datetime_utc": "2022-03-05T05:25:00+00:00",
                                "end_datetime_local": "2022-03-05T09:05:00+03:00",
                                "end_datetime_utc": "2022-03-05T06:05:00+00:00",
                                "class": "Moto3",
                                "session_name": "Free Practice Nr. 3",
                                "session_short_name": "FP3"
                            },
                            {
                                "start_datetime_local": "2022-03-05T12:20:00+03:00",
                                "start_datetime_utc": "2022-03-05T09:20:00+00:00",
                                "end_datetime_local": "2022-03-05T13:00:00+03:00",
                                "end_datetime_utc": "2022-03-05T10:00:00+00:00",
                                "class": "Moto2",
                                "session_name": "Free Practice Nr. 3",
                                "session_short_name": "FP3"
                            },
                            {
                                "start_datetime_local": "2022-03-05T12:30:00+03:00",
                                "start_datetime_utc": "2022-03-05T09:30:00+00:00",
                                "end_datetime_local": "2022-03-05T12:45:00+03:00",
                                "end_datetime_utc": "2022-03-05T09:45:00+00:00",
                                "class": "Moto3",
                                "session_name": "Qualifying Nr. 1 ",
                                "session_short_name": "Q1"
                            },
                            {
                                "start_datetime_local": "2022-03-05T12:55:00+03:00",
                                "start_datetime_utc": "2022-03-05T09:55:00+00:00",
                                "end_datetime_local": "2022-03-05T13:10:00+03:00",
                                "end_datetime_utc": "2022-03-05T10:10:00+00:00",
                                "class": "Moto3",
                                "session_name": "Qualifying Nr. 2 ",
                                "session_short_name": "Q2"
                            },
                            {
                                "start_datetime_local": "2022-03-05T13:15:00+03:00",
                                "start_datetime_utc": "2022-03-05T10:15:00+00:00",
                                "end_datetime_local": "2022-03-05T14:00:00+03:00",
                                "end_datetime_utc": "2022-03-05T11:00:00+00:00",
                                "class": "MotoGP",
                                "session_name": "Free Practice Nr. 3",
                                "session_short_name": "FP3"
                            },
                            {
                                "start_datetime_local": "2022-03-05T16:25:00+03:00",
                                "start_datetime_utc": "2022-03-05T13:25:00+00:00",
                                "end_datetime_local": "2022-03-05T16:40:00+03:00",
                                "end_datetime_utc": "2022-03-05T13:40:00+00:00",
                                "class": "Moto2",
                                "session_name": "Qualifying Nr. 1 ",
                                "session_short_name": "Q1"
                            },
                            {
                                "start_datetime_local": "2022-03-05T16:50:00+03:00",
                                "start_datetime_utc": "2022-03-05T13:50:00+00:00",
                                "end_datetime_local": "2022-03-05T17:05:00+03:00",
                                "end_datetime_utc": "2022-03-05T14:05:00+00:00",
                                "class": "Moto2",
                                "session_name": "Qualifying Nr. 2 ",
                                "session_short_name": "Q2"
                            },
                            {
                                "start_datetime_local": "2022-03-05T17:20:00+03:00",
                                "start_datetime_utc": "2022-03-05T14:20:00+00:00",
                                "end_datetime_local": "2022-03-05T17:50:00+03:00",
                                "end_datetime_utc": "2022-03-05T14:50:00+00:00",
                                "class": "MotoGP",
                                "session_name": "Free Practice Nr. 4",
                                "session_short_name": "FP4"
                            },
                            {
                                "start_datetime_local": "2022-03-05T18:00:00+03:00",
                                "start_datetime_utc": "2022-03-05T15:00:00+00:00",
                                "end_datetime_local": "2022-03-05T18:15:00+03:00",
                                "end_datetime_utc": "2022-03-05T15:15:00+00:00",
                                "class": "MotoGP",
                                "session_name": "Qualifying Nr. 1 ",
                                "session_short_name": "Q1"
                            },
                            {
                                "start_datetime_local": "2022-03-05T18:25:00+03:00",
                                "start_datetime_utc": "2022-03-05T15:25:00+00:00",
                                "end_datetime_local": "2022-03-05T18:40:00+03:00",
                                "end_datetime_utc": "2022-03-05T15:40:00+00:00",
                                "class": "MotoGP",
                                "session_name": "Qualifying Nr. 2 ",
                                "session_short_name": "Q2"
                            }
                        ]
                    },
                    {
                        "start_datetime_utc": "2022-03-06T10:00:00+03:00",
                        "day_of_week": "Sunday",
                        "sessions": [
                            {
                                "start_datetime_local": "2022-03-06T10:00:00+03:00",
                                "start_datetime_utc": "2022-03-06T07:00:00+00:00",
                                "end_datetime_local": "2022-03-06T10:10:00+03:00",
                                "end_datetime_utc": "2022-03-06T07:10:00+00:00",
                                "class": "Moto3",
                                "session_name": "Warm Up",
                                "session_short_name": "WUP"
                            },
                            {
                                "start_datetime_local": "2022-03-06T12:00:00+03:00",
                                "start_datetime_utc": "2022-03-06T09:00:00+00:00",
                                "class": "Moto3",
                                "session_name": "Race",
                                "session_short_name": "RAC"
                            },
                            {
                                "start_datetime_local": "2022-03-06T13:20:00+03:00",
                                "start_datetime_utc": "2022-03-06T10:20:00+00:00",
                                "end_datetime_local": "2022-03-06T13:30:00+03:00",
                                "end_datetime_utc": "2022-03-06T10:30:00+00:00",
                                "class": "Moto2",
                                "session_name": "Warm Up",
                                "session_short_name": "WUP"
                            },
                            {
                                "start_datetime_local": "2022-03-06T13:40:00+03:00",
                                "start_datetime_utc": "2022-03-06T10:40:00+00:00",
                                "end_datetime_local": "2022-03-06T14:00:00+03:00",
                                "end_datetime_utc": "2022-03-06T11:00:00+00:00",
                                "class": "MotoGP",
                                "session_name": "Warm Up",
                                "session_short_name": "WUP"
                            },
                            {
                                "start_datetime_local": "2022-03-06T16:20:00+03:00",
                                "start_datetime_utc": "2022-03-06T13:20:00+00:00",
                                "class": "Moto2",
                                "session_name": "Race",
                                "session_short_name": "RAC"
                            },
                            {
                                "start_datetime_local": "2022-03-06T18:00:00+03:00",
                                "start_datetime_utc": "2022-03-06T15:00:00+00:00",
                                "class": "MotoGP",
                                "session_name": "Race",
                                "session_short_name": "RAC"
                            }
                        ]
                    }
                ]
            }
        }
        """
    }

    var valenciaResponse: String {
        """
        {
            "name": "Gran Premio Motul de la Comunitat Valenciana",
            "circuit": "Circuit Ricardo Tormo",
            "country_code": "ES",
            "country": "Spain",
            "start_date": "2022-11-04T00:00:00.000000Z",
            "end_date": "2022-11-06T00:00:00.000000Z",
            "local_tz_offset": 1,
            "test": 0,
            "dates": "04 Nov - 06 Nov",
            "sessions_grouped_by_date": {
                "utc": [
                    {
                        "start_datetime_utc": "2022-11-03T09:30:00+00:00",
                        "day_of_week": "Thursday",
                        "sessions": [
                            {
                                "start_datetime_local": "2022-11-03T10:30:00+01:00",
                                "start_datetime_utc": "2022-11-03T09:30:00+00:00",
                                "end_datetime_local": "2022-11-03T13:30:00+01:00",
                                "end_datetime_utc": "2022-11-03T12:30:00+00:00",
                                "class": "MotoGP",
                                "session_name": "FIM MiniGP World Series - Races",
                                "session_short_name": "SHOW"
                            },
                            {
                                "start_datetime_local": "2022-11-03T14:00:00+01:00",
                                "start_datetime_utc": "2022-11-03T13:00:00+00:00",
                                "end_datetime_local": "2022-11-03T15:00:00+01:00",
                                "end_datetime_utc": "2022-11-03T14:00:00+00:00",
                                "class": "MotoGP",
                                "session_name": "FIM MiniGP World Series - Super Final Race",
                                "session_short_name": "SHOW"
                            }
                        ]
                    },
                    {
                        "start_datetime_utc": "2022-11-04T08:00:00+00:00",
                        "day_of_week": "Friday",
                        "sessions": [
                            {
                                "start_datetime_local": "2022-11-04T09:00:00+01:00",
                                "start_datetime_utc": "2022-11-04T08:00:00+00:00",
                                "end_datetime_local": "2022-11-04T09:40:00+01:00",
                                "end_datetime_utc": "2022-11-04T08:40:00+00:00",
                                "class": "Moto3",
                                "session_name": "Free Practice Nr. 1",
                                "session_short_name": "FP1"
                            },
                            {
                                "start_datetime_local": "2022-11-04T09:55:00+01:00",
                                "start_datetime_utc": "2022-11-04T08:55:00+00:00",
                                "end_datetime_local": "2022-11-04T10:40:00+01:00",
                                "end_datetime_utc": "2022-11-04T09:40:00+00:00",
                                "class": "MotoGP",
                                "session_name": "Free Practice Nr. 1",
                                "session_short_name": "FP1"
                            },
                            {
                                "start_datetime_local": "2022-11-04T10:55:00+01:00",
                                "start_datetime_utc": "2022-11-04T09:55:00+00:00",
                                "end_datetime_local": "2022-11-04T11:35:00+01:00",
                                "end_datetime_utc": "2022-11-04T10:35:00+00:00",
                                "class": "Moto2",
                                "session_name": "Free Practice Nr. 1",
                                "session_short_name": "FP1"
                            },
                            {
                                "start_datetime_local": "2022-11-04T13:15:00+01:00",
                                "start_datetime_utc": "2022-11-04T12:15:00+00:00",
                                "end_datetime_local": "2022-11-04T13:55:00+01:00",
                                "end_datetime_utc": "2022-11-04T12:55:00+00:00",
                                "class": "Moto3",
                                "session_name": "Free Practice Nr. 2",
                                "session_short_name": "FP2"
                            },
                            {
                                "start_datetime_local": "2022-11-04T14:10:00+01:00",
                                "start_datetime_utc": "2022-11-04T13:10:00+00:00",
                                "end_datetime_local": "2022-11-04T14:55:00+01:00",
                                "end_datetime_utc": "2022-11-04T13:55:00+00:00",
                                "class": "MotoGP",
                                "session_name": "Free Practice Nr. 2",
                                "session_short_name": "FP2"
                            },
                            {
                                "start_datetime_local": "2022-11-04T15:10:00+01:00",
                                "start_datetime_utc": "2022-11-04T14:10:00+00:00",
                                "end_datetime_local": "2022-11-04T15:50:00+01:00",
                                "end_datetime_utc": "2022-11-04T14:50:00+00:00",
                                "class": "Moto2",
                                "session_name": "Free Practice Nr. 2",
                                "session_short_name": "FP2"
                            }
                        ]
                    },
                    {
                        "start_datetime_utc": "2022-11-05T08:00:00+00:00",
                        "day_of_week": "Saturday",
                        "sessions": [
                            {
                                "start_datetime_local": "2022-11-05T09:00:00+01:00",
                                "start_datetime_utc": "2022-11-05T08:00:00+00:00",
                                "end_datetime_local": "2022-11-05T09:40:00+01:00",
                                "end_datetime_utc": "2022-11-05T08:40:00+00:00",
                                "class": "Moto3",
                                "session_name": "Free Practice Nr. 3",
                                "session_short_name": "FP3"
                            },
                            {
                                "start_datetime_local": "2022-11-05T09:55:00+01:00",
                                "start_datetime_utc": "2022-11-05T08:55:00+00:00",
                                "end_datetime_local": "2022-11-05T10:40:00+01:00",
                                "end_datetime_utc": "2022-11-05T09:40:00+00:00",
                                "class": "MotoGP",
                                "session_name": "Free Practice Nr. 3",
                                "session_short_name": "FP3"
                            },
                            {
                                "start_datetime_local": "2022-11-05T10:55:00+01:00",
                                "start_datetime_utc": "2022-11-05T09:55:00+00:00",
                                "end_datetime_local": "2022-11-05T11:35:00+01:00",
                                "end_datetime_utc": "2022-11-05T10:35:00+00:00",
                                "class": "Moto2",
                                "session_name": "Free Practice Nr. 3",
                                "session_short_name": "FP3"
                            },
                            {
                                "start_datetime_local": "2022-11-05T12:35:00+01:00",
                                "start_datetime_utc": "2022-11-05T11:35:00+00:00",
                                "end_datetime_local": "2022-11-05T12:50:00+01:00",
                                "end_datetime_utc": "2022-11-05T11:50:00+00:00",
                                "class": "Moto3",
                                "session_name": "Qualifying Nr. 1 ",
                                "session_short_name": "Q1"
                            },
                            {
                                "start_datetime_local": "2022-11-05T13:00:00+01:00",
                                "start_datetime_utc": "2022-11-05T12:00:00+00:00",
                                "end_datetime_local": "2022-11-05T13:15:00+01:00",
                                "end_datetime_utc": "2022-11-05T12:15:00+00:00",
                                "class": "Moto3",
                                "session_name": "Qualifying Nr. 2 ",
                                "session_short_name": "Q2"
                            },
                            {
                                "start_datetime_local": "2022-11-05T13:30:00+01:00",
                                "start_datetime_utc": "2022-11-05T12:30:00+00:00",
                                "end_datetime_local": "2022-11-05T14:00:00+01:00",
                                "end_datetime_utc": "2022-11-05T13:00:00+00:00",
                                "class": "MotoGP",
                                "session_name": "Free Practice Nr. 4",
                                "session_short_name": "FP4"
                            },
                            {
                                "start_datetime_local": "2022-11-05T14:10:00+01:00",
                                "start_datetime_utc": "2022-11-05T13:10:00+00:00",
                                "end_datetime_local": "2022-11-05T14:25:00+01:00",
                                "end_datetime_utc": "2022-11-05T13:25:00+00:00",
                                "class": "MotoGP",
                                "session_name": "Qualifying Nr. 1 ",
                                "session_short_name": "Q1"
                            },
                            {
                                "start_datetime_local": "2022-11-05T14:35:00+01:00",
                                "start_datetime_utc": "2022-11-05T13:35:00+00:00",
                                "end_datetime_local": "2022-11-05T14:50:00+01:00",
                                "end_datetime_utc": "2022-11-05T13:50:00+00:00",
                                "class": "MotoGP",
                                "session_name": "Qualifying Nr. 2 ",
                                "session_short_name": "Q2"
                            },
                            {
                                "start_datetime_local": "2022-11-05T15:10:00+01:00",
                                "start_datetime_utc": "2022-11-05T14:10:00+00:00",
                                "end_datetime_local": "2022-11-05T15:25:00+01:00",
                                "end_datetime_utc": "2022-11-05T14:25:00+00:00",
                                "class": "Moto2",
                                "session_name": "Qualifying Nr. 1 ",
                                "session_short_name": "Q1"
                            },
                            {
                                "start_datetime_local": "2022-11-05T15:35:00+01:00",
                                "start_datetime_utc": "2022-11-05T14:35:00+00:00",
                                "end_datetime_local": "2022-11-05T15:50:00+01:00",
                                "end_datetime_utc": "2022-11-05T14:50:00+00:00",
                                "class": "Moto2",
                                "session_name": "Qualifying Nr. 2 ",
                                "session_short_name": "Q2"
                            }
                        ]
                    },
                    {
                        "start_datetime_utc": "2022-11-06T08:00:00+00:00",
                        "day_of_week": "Sunday",
                        "sessions": [
                            {
                                "start_datetime_local": "2022-11-06T09:00:00+01:00",
                                "start_datetime_utc": "2022-11-06T08:00:00+00:00",
                                "end_datetime_local": "2022-11-06T09:10:00+01:00",
                                "end_datetime_utc": "2022-11-06T08:10:00+00:00",
                                "class": "Moto3",
                                "session_name": "Warm Up",
                                "session_short_name": "WUP"
                            },
                            {
                                "start_datetime_local": "2022-11-06T09:20:00+01:00",
                                "start_datetime_utc": "2022-11-06T08:20:00+00:00",
                                "end_datetime_local": "2022-11-06T09:30:00+01:00",
                                "end_datetime_utc": "2022-11-06T08:30:00+00:00",
                                "class": "Moto2",
                                "session_name": "Warm Up",
                                "session_short_name": "WUP"
                            },
                            {
                                "start_datetime_local": "2022-11-06T09:40:00+01:00",
                                "start_datetime_utc": "2022-11-06T08:40:00+00:00",
                                "end_datetime_local": "2022-11-06T10:00:00+01:00",
                                "end_datetime_utc": "2022-11-06T09:00:00+00:00",
                                "class": "MotoGP",
                                "session_name": "Warm Up",
                                "session_short_name": "WUP"
                            },
                            {
                                "start_datetime_local": "2022-11-06T11:00:00+01:00",
                                "start_datetime_utc": "2022-11-06T10:00:00+00:00",
                                "class": "Moto3",
                                "session_name": "Race",
                                "session_short_name": "RAC"
                            },
                            {
                                "start_datetime_local": "2022-11-06T12:20:00+01:00",
                                "start_datetime_utc": "2022-11-06T11:20:00+00:00",
                                "class": "Moto2",
                                "session_name": "Race",
                                "session_short_name": "RAC"
                            },
                            {
                                "start_datetime_local": "2022-11-06T14:00:00+01:00",
                                "start_datetime_utc": "2022-11-06T13:00:00+00:00",
                                "class": "MotoGP",
                                "session_name": "Race",
                                "session_short_name": "RAC"
                            }
                        ]
                    }
                ],
                "local": [
                    {
                        "start_datetime_utc": "2022-11-03T10:30:00+01:00",
                        "day_of_week": "Thursday",
                        "sessions": [
                            {
                                "start_datetime_local": "2022-11-03T10:30:00+01:00",
                                "start_datetime_utc": "2022-11-03T09:30:00+00:00",
                                "end_datetime_local": "2022-11-03T13:30:00+01:00",
                                "end_datetime_utc": "2022-11-03T12:30:00+00:00",
                                "class": "MotoGP",
                                "session_name": "FIM MiniGP World Series - Races",
                                "session_short_name": "SHOW"
                            },
                            {
                                "start_datetime_local": "2022-11-03T14:00:00+01:00",
                                "start_datetime_utc": "2022-11-03T13:00:00+00:00",
                                "end_datetime_local": "2022-11-03T15:00:00+01:00",
                                "end_datetime_utc": "2022-11-03T14:00:00+00:00",
                                "class": "MotoGP",
                                "session_name": "FIM MiniGP World Series - Super Final Race",
                                "session_short_name": "SHOW"
                            }
                        ]
                    },
                    {
                        "start_datetime_utc": "2022-11-04T09:00:00+01:00",
                        "day_of_week": "Friday",
                        "sessions": [
                            {
                                "start_datetime_local": "2022-11-04T09:00:00+01:00",
                                "start_datetime_utc": "2022-11-04T08:00:00+00:00",
                                "end_datetime_local": "2022-11-04T09:40:00+01:00",
                                "end_datetime_utc": "2022-11-04T08:40:00+00:00",
                                "class": "Moto3",
                                "session_name": "Free Practice Nr. 1",
                                "session_short_name": "FP1"
                            },
                            {
                                "start_datetime_local": "2022-11-04T09:55:00+01:00",
                                "start_datetime_utc": "2022-11-04T08:55:00+00:00",
                                "end_datetime_local": "2022-11-04T10:40:00+01:00",
                                "end_datetime_utc": "2022-11-04T09:40:00+00:00",
                                "class": "MotoGP",
                                "session_name": "Free Practice Nr. 1",
                                "session_short_name": "FP1"
                            },
                            {
                                "start_datetime_local": "2022-11-04T10:55:00+01:00",
                                "start_datetime_utc": "2022-11-04T09:55:00+00:00",
                                "end_datetime_local": "2022-11-04T11:35:00+01:00",
                                "end_datetime_utc": "2022-11-04T10:35:00+00:00",
                                "class": "Moto2",
                                "session_name": "Free Practice Nr. 1",
                                "session_short_name": "FP1"
                            },
                            {
                                "start_datetime_local": "2022-11-04T13:15:00+01:00",
                                "start_datetime_utc": "2022-11-04T12:15:00+00:00",
                                "end_datetime_local": "2022-11-04T13:55:00+01:00",
                                "end_datetime_utc": "2022-11-04T12:55:00+00:00",
                                "class": "Moto3",
                                "session_name": "Free Practice Nr. 2",
                                "session_short_name": "FP2"
                            },
                            {
                                "start_datetime_local": "2022-11-04T14:10:00+01:00",
                                "start_datetime_utc": "2022-11-04T13:10:00+00:00",
                                "end_datetime_local": "2022-11-04T14:55:00+01:00",
                                "end_datetime_utc": "2022-11-04T13:55:00+00:00",
                                "class": "MotoGP",
                                "session_name": "Free Practice Nr. 2",
                                "session_short_name": "FP2"
                            },
                            {
                                "start_datetime_local": "2022-11-04T15:10:00+01:00",
                                "start_datetime_utc": "2022-11-04T14:10:00+00:00",
                                "end_datetime_local": "2022-11-04T15:50:00+01:00",
                                "end_datetime_utc": "2022-11-04T14:50:00+00:00",
                                "class": "Moto2",
                                "session_name": "Free Practice Nr. 2",
                                "session_short_name": "FP2"
                            }
                        ]
                    },
                    {
                        "start_datetime_utc": "2022-11-05T09:00:00+01:00",
                        "day_of_week": "Saturday",
                        "sessions": [
                            {
                                "start_datetime_local": "2022-11-05T09:00:00+01:00",
                                "start_datetime_utc": "2022-11-05T08:00:00+00:00",
                                "end_datetime_local": "2022-11-05T09:40:00+01:00",
                                "end_datetime_utc": "2022-11-05T08:40:00+00:00",
                                "class": "Moto3",
                                "session_name": "Free Practice Nr. 3",
                                "session_short_name": "FP3"
                            },
                            {
                                "start_datetime_local": "2022-11-05T09:55:00+01:00",
                                "start_datetime_utc": "2022-11-05T08:55:00+00:00",
                                "end_datetime_local": "2022-11-05T10:40:00+01:00",
                                "end_datetime_utc": "2022-11-05T09:40:00+00:00",
                                "class": "MotoGP",
                                "session_name": "Free Practice Nr. 3",
                                "session_short_name": "FP3"
                            },
                            {
                                "start_datetime_local": "2022-11-05T10:55:00+01:00",
                                "start_datetime_utc": "2022-11-05T09:55:00+00:00",
                                "end_datetime_local": "2022-11-05T11:35:00+01:00",
                                "end_datetime_utc": "2022-11-05T10:35:00+00:00",
                                "class": "Moto2",
                                "session_name": "Free Practice Nr. 3",
                                "session_short_name": "FP3"
                            },
                            {
                                "start_datetime_local": "2022-11-05T12:35:00+01:00",
                                "start_datetime_utc": "2022-11-05T11:35:00+00:00",
                                "end_datetime_local": "2022-11-05T12:50:00+01:00",
                                "end_datetime_utc": "2022-11-05T11:50:00+00:00",
                                "class": "Moto3",
                                "session_name": "Qualifying Nr. 1 ",
                                "session_short_name": "Q1"
                            },
                            {
                                "start_datetime_local": "2022-11-05T13:00:00+01:00",
                                "start_datetime_utc": "2022-11-05T12:00:00+00:00",
                                "end_datetime_local": "2022-11-05T13:15:00+01:00",
                                "end_datetime_utc": "2022-11-05T12:15:00+00:00",
                                "class": "Moto3",
                                "session_name": "Qualifying Nr. 2 ",
                                "session_short_name": "Q2"
                            },
                            {
                                "start_datetime_local": "2022-11-05T13:30:00+01:00",
                                "start_datetime_utc": "2022-11-05T12:30:00+00:00",
                                "end_datetime_local": "2022-11-05T14:00:00+01:00",
                                "end_datetime_utc": "2022-11-05T13:00:00+00:00",
                                "class": "MotoGP",
                                "session_name": "Free Practice Nr. 4",
                                "session_short_name": "FP4"
                            },
                            {
                                "start_datetime_local": "2022-11-05T14:10:00+01:00",
                                "start_datetime_utc": "2022-11-05T13:10:00+00:00",
                                "end_datetime_local": "2022-11-05T14:25:00+01:00",
                                "end_datetime_utc": "2022-11-05T13:25:00+00:00",
                                "class": "MotoGP",
                                "session_name": "Qualifying Nr. 1 ",
                                "session_short_name": "Q1"
                            },
                            {
                                "start_datetime_local": "2022-11-05T14:35:00+01:00",
                                "start_datetime_utc": "2022-11-05T13:35:00+00:00",
                                "end_datetime_local": "2022-11-05T14:50:00+01:00",
                                "end_datetime_utc": "2022-11-05T13:50:00+00:00",
                                "class": "MotoGP",
                                "session_name": "Qualifying Nr. 2 ",
                                "session_short_name": "Q2"
                            },
                            {
                                "start_datetime_local": "2022-11-05T15:10:00+01:00",
                                "start_datetime_utc": "2022-11-05T14:10:00+00:00",
                                "end_datetime_local": "2022-11-05T15:25:00+01:00",
                                "end_datetime_utc": "2022-11-05T14:25:00+00:00",
                                "class": "Moto2",
                                "session_name": "Qualifying Nr. 1 ",
                                "session_short_name": "Q1"
                            },
                            {
                                "start_datetime_local": "2022-11-05T15:35:00+01:00",
                                "start_datetime_utc": "2022-11-05T14:35:00+00:00",
                                "end_datetime_local": "2022-11-05T15:50:00+01:00",
                                "end_datetime_utc": "2022-11-05T14:50:00+00:00",
                                "class": "Moto2",
                                "session_name": "Qualifying Nr. 2 ",
                                "session_short_name": "Q2"
                            }
                        ]
                    },
                    {
                        "start_datetime_utc": "2022-11-06T09:00:00+01:00",
                        "day_of_week": "Sunday",
                        "sessions": [
                            {
                                "start_datetime_local": "2022-11-06T09:00:00+01:00",
                                "start_datetime_utc": "2022-11-06T08:00:00+00:00",
                                "end_datetime_local": "2022-11-06T09:10:00+01:00",
                                "end_datetime_utc": "2022-11-06T08:10:00+00:00",
                                "class": "Moto3",
                                "session_name": "Warm Up",
                                "session_short_name": "WUP"
                            },
                            {
                                "start_datetime_local": "2022-11-06T09:20:00+01:00",
                                "start_datetime_utc": "2022-11-06T08:20:00+00:00",
                                "end_datetime_local": "2022-11-06T09:30:00+01:00",
                                "end_datetime_utc": "2022-11-06T08:30:00+00:00",
                                "class": "Moto2",
                                "session_name": "Warm Up",
                                "session_short_name": "WUP"
                            },
                            {
                                "start_datetime_local": "2022-11-06T09:40:00+01:00",
                                "start_datetime_utc": "2022-11-06T08:40:00+00:00",
                                "end_datetime_local": "2022-11-06T10:00:00+01:00",
                                "end_datetime_utc": "2022-11-06T09:00:00+00:00",
                                "class": "MotoGP",
                                "session_name": "Warm Up",
                                "session_short_name": "WUP"
                            },
                            {
                                "start_datetime_local": "2022-11-06T11:00:00+01:00",
                                "start_datetime_utc": "2022-11-06T10:00:00+00:00",
                                "class": "Moto3",
                                "session_name": "Race",
                                "session_short_name": "RAC"
                            },
                            {
                                "start_datetime_local": "2022-11-06T12:20:00+01:00",
                                "start_datetime_utc": "2022-11-06T11:20:00+00:00",
                                "class": "Moto2",
                                "session_name": "Race",
                                "session_short_name": "RAC"
                            },
                            {
                                "start_datetime_local": "2022-11-06T14:00:00+01:00",
                                "start_datetime_utc": "2022-11-06T13:00:00+00:00",
                                "class": "MotoGP",
                                "session_name": "Race",
                                "session_short_name": "RAC"
                            }
                        ]
                    }
                ]
            }
        }
        """
    }
}
