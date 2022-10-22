//
//  URLRequestNetworkingImpl.swift
//  
//
//  Created by Lukas Ruzicka on 23.10.2022.
//

import Foundation

final actor URLRequestNetworkingImpl {

    // MARK: - Properties
    private let urlSession = URLSession(configuration: .default)
    private let decoder = JSONDecoder()
}

// MARK: - Protocol conformance
extension URLRequestNetworkingImpl: Networking {

    func request<Response: Decodable>(_ spec: NetworkingRequest) async throws -> Response {
        let (data, _) = try await urlSession.data(for: urlRequest(for: spec))
        return try decoder.decode(Response.self, from: data)
    }

    func request(_ spec: NetworkingRequest) async throws {
        _ = try await urlSession.data(for: urlRequest(for: spec))
    }
}

// MARK: - Supporting functions
private extension URLRequestNetworkingImpl {

    func urlRequest(for spec: NetworkingRequest) -> URLRequest {
        let url = spec.baseUrl
            .appending(path: spec.path)
            .appending(queryItems: spec.queryItems)
        var request = URLRequest(url: url)
        request.httpMethod = spec.method.rawValue.uppercased()
        request.httpBody = spec.body
        return request
    }
}
