//
//  HomeView.swift
//  InstaStories
//
//  Created by Anis BOUZIANE on 07/03/2025.
//

import SwiftUI
import Factory

struct HomeView: View {
    var body: some View {
        NavigationView {
            VStack {
                StoryListView(container: Container.shared)

                Spacer()
            }
            .navigationTitle("InstaStories")
        }
    }
}

#Preview {
    HomeView()
}
