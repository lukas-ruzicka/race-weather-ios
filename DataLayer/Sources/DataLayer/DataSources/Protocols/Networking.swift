//
//  Networking.swift
//  
//
//  Created by Lukas Ruzicka on 23.10.2022.
//

protocol Networking {

    func request<Response: Decodable>(_ spec: NetworkingRequest) async throws -> Response
    func request(_ spec: NetworkingRequest) async throws
}
