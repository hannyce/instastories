//
//  StoryListUseCase.swift
//  InstaStories
//
//  Created by Anis BOUZIANE on 07/03/2025.
//

import Factory

class StoryListUseCase {
    @Injected(\.storyListRepositoryProtocol) var repository

    func fetchUsers() async throws -> [User] {
        do {
            return try await repository.fetchUserList()
        } catch {
            print(error.localizedDescription)
            throw FetchError.failedToFetchUsers
        }
    }
}

extension Container {
    var storyListUseCase: Factory<StoryListUseCase> {
        Factory(self) { StoryListUseCase() }
    }
}
