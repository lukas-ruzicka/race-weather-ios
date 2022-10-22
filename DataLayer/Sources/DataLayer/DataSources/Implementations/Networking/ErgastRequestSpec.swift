//
//  ErgastRequestSpec.swift
//  
//
//  Created by Lukas Ruzicka on 23.10.2022.
//

import Foundation

struct ErgastRequestSpec: NetworkingRequest {

    let baseUrl = URL(string: "https://ergast.com/api")!
    let path: String
    var method: HTTPMethod = .get
    var headers: [String : String]?
    var queryItems: [URLQueryItem] = []
    var body: Data?
}

// MARK: - Requests
extension ErgastRequestSpec {

    static var getFormula1ThisYearsEvents: ErgastRequestSpec {
        .init(path: "f1/current.json")
    }
}
