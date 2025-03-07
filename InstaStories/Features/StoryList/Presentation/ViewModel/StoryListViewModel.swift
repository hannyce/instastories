//
//  StoryListViewModel.swift
//  InstaStories
//
//  Created by Anis BOUZIANE on 07/03/2025.
//

import Combine
import Factory

class StoryListViewModel: ObservableObject {

    @Injected(\.storyListUseCase) private var useCase

    @Published var isLoading = false
    @Published var users: [User] = []

    init() {
        Task {
            await fetchUsers()
        }
    }

    private func fetchUsers() async {
        isLoading = true
        do {
            let users = try await useCase.fetchUsers()
            self.users = users
            isLoading = false
        } catch {
            print("error ...")
        }
    }
}

extension Container {
    var storyListViewModel: Factory<StoryListViewModel> {
        Factory(self) { StoryListViewModel() }
    }
}
