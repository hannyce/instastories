//
//  User.swift
//  InstaStories
//
//  Created by Anis BOUZIANE on 07/03/2025.
//

import Foundation
import SwiftData

@Model
class User: Identifiable {
    @Attribute(.unique) var id: String
    var username: String
    var imagePath: String
    var seen: Bool

    init(id: String, username: String, imagePath: String, seen: Bool = false) {
        self.id = id
        self.username = username
        self.imagePath = imagePath
        self.seen = seen
    }
}

extension User {
   static var sample: [User] {
        [
            User(id: "1", username: "user1", imagePath: "person.crop.circle.fill", seen: Bool.random()),
            User(id: "1", username: "user2", imagePath: "person.crop.circle.fill", seen: Bool.random()),
            User(id: "1", username: "user3", imagePath: "person.crop.circle.fill", seen: Bool.random()),
            User(id: "1", username: "user4", imagePath: "person.crop.circle.fill", seen: Bool.random()),
            User(id: "1", username: "user5", imagePath: "person.crop.circle.fill", seen: Bool.random()),
            User(id: "1", username: "user6", imagePath: "person.crop.circle.fill", seen: Bool.random()),
            User(id: "1", username: "user7", imagePath: "person.crop.circle.fill", seen: Bool.random()),
            User(id: "1", username: "user8", imagePath: "person.crop.circle.fill", seen: Bool.random())
        ]
    }
}
