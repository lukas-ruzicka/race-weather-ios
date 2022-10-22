//
//  NetworkingRequest.swift
//  
//
//  Created by Lukas Ruzicka on 23.10.2022.
//

import Foundation

protocol NetworkingRequest {

    var baseUrl: URL { get }
    var path: String { get }
    var method: HTTPMethod { get }
    var headers: [String: String]? { get }
    var queryItems: [URLQueryItem] { get }
    var body: Data? { get }
}

enum HTTPMethod: String {

    case get
    case post
}
