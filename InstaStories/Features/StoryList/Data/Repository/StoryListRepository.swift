//
//  StoryListRepository.swift
//  InstaStories
//
//  Created by Anis BOUZIANE on 07/03/2025.
//

import Foundation
import Factory

class StoryListRepository: StoryListRepositoryProtocol {

    @Injected(\.storyListService) var service

    func fetchUserList() async throws -> [User] {
        do {
            let data = try await service.fetchUserList()
            let usersDTO = try JSONDecoder().decode([UsersDTO].self, from: data)
            let users = usersDTO.map { $0.toDomain() }
            return users
        } catch {
            throw GenericError.decodingFailed(error)
        }
    }
}

extension Container {
    var storyListRepositoryProtocol: Factory<StoryListRepositoryProtocol> {
        self { StoryListRepository() }
    }
}
