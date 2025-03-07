//
//  StoryListService.swift
//  InstaStories
//
//  Created by Anis BOUZIANE on 07/03/2025.
//

import Foundation
import Factory

class StoryListService {
    @Injected(\.httpClient) private var client: HTTP

    func fetchUserList() async throws -> Data {
        let request = Endpoint.users.request
        do {
            return try await client.get(request)
        } catch {
            throw NetworkError.requestFailed
        }
    }
}

extension Container {
    var storyListService: Factory<StoryListService> {
        self { StoryListService() }
    }
}
