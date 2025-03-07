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
    var liked: Bool

    init(id: String, username: String, imagePath: String, seen: Bool = false, liked: Bool = false) {
        self.id = id
        self.username = username
        self.imagePath = imagePath
        self.seen = seen
        self.liked = liked
    }
}
