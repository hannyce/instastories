//
//  UsersDTO.swift
//  InstaStories
//
//  Created by Anis BOUZIANE on 07/03/2025.
//

struct UsersDTO: Decodable {
    let id: String
    let author: String
    let download_url: String

    func toDomain() -> User {
        User(id: id, username: author, imagePath: download_url)
    }
}
