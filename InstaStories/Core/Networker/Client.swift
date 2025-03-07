//
//  Client.swift
//  InstaStories
//
//  Created by Anis BOUZIANE on 07/03/2025.
//

import Foundation
import Factory

protocol HTTP {
    func get(_ request: URLRequest) async throws -> Data
}

class Client: HTTP {
    func get(_ request: URLRequest) async throws -> Data {

        guard let url = request.url else {
            throw URLError(.badURL)
        }

        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            return data
        } catch {
            throw NetworkError.requestFailed
        }
    }
}

extension Container {
    var httpClient: Factory<HTTP> {
        self { Client() }
    }
}
