//
//  MotoTimingRequestSpec.swift
//  
//
//  Created by Lukas Ruzicka on 28.10.2022.
//

import Foundation

struct MotoTimingRequestSpec: NetworkingRequest {

    let baseUrl = URL(string: "https://mototiming.live/api")!
    let path: String
    var method: HTTPMethod = .get
    var headers: [String : String]?
    var queryItems: [URLQueryItem] = []
    var body: Data?
}

// MARK: - Requests
extension MotoTimingRequestSpec {

    static var getMotogpThisYearsEvents: MotoTimingRequestSpec {
        .init(path: "schedule")
    }

    static func getMotogpEventDetail(_ eventName: String) -> MotoTimingRequestSpec {
        .init(
            path: "schedule",
            queryItems: [
                .init(name: "event", value: eventName.replacingOccurrences(of: " ", with: "+"))
            ]
        )
    }
}
