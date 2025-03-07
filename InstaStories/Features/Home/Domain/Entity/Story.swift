//
//  Story.swift
//  InstaStories
//
//  Created by Anis BOUZIANE on 07/03/2025.
//

import Foundation

struct Story: Identifiable {
    let id = UUID()
    let username: String
    let image: String
    let stories: [StoryItem]
    var seen = false
}
