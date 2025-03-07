//
//  StoryItem.swift
//  InstaStories
//
//  Created by Anis BOUZIANE on 07/03/2025.
//

import Foundation

struct StoryItem {
    let id = UUID()
    let image: String
    let date: Date
    var seen = false
}
