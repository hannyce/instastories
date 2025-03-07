//
//  StoryListRepositoryProtocol.swift
//  InstaStories
//
//  Created by Anis BOUZIANE on 07/03/2025.
//

protocol StoryListRepositoryProtocol {
    func fetchUserList() async throws -> [User]
}
