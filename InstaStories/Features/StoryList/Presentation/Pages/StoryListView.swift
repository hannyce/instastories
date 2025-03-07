//
//  StoryListView.swift
//  InstaStories
//
//  Created by Anis BOUZIANE on 07/03/2025.
//

import SwiftUI
import Factory

struct StoryListView: View {

    @StateObject private var viewModel: StoryListViewModel
    @State private var selectedUser: User?

    init(container: Container) {
        _viewModel = StateObject(wrappedValue: container.storyListViewModel())
    }

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 12) {
                
                VStack(spacing: 3) {
                    ZStack {
                        Circle()
                            .fill(Color(.systemGray5))
                            .frame(width: 65, height: 65)

                        Image(systemName: "person.crop.circle.fill")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 60, height: 60)
                            .clipShape(Circle())
                            .foregroundColor(.gray)

                        Circle()
                            .stroke(Color.blue, lineWidth: 2)
                            .frame(width: 68, height: 68)

                        Image(systemName: "plus.circle.fill")
                            .resizable()
                            .frame(width: 20, height: 20)
                            .foregroundColor(.blue)
                            .background(Circle().fill(Color.white))
                            .offset(x: 22, y: 22)
                    }

                    Text("Add story")
                        .font(.system(size: 12))
                        .foregroundColor(.primary)
                }

                ForEach(viewModel.users) { user in
                    VStack(spacing: 3) {
                        ZStack {
                            Circle()
                                .stroke(
                                    LinearGradient(
                                        gradient: Gradient(colors: user.seen ? [.purple, .red, .orange] : [.red]),
                                        startPoint: .topLeading,
                                        endPoint: .bottomTrailing
                                    ),
                                    lineWidth: 2
                                )
                                .frame(width: 68, height: 68)

                            AsyncImage(url: URL(string: user.imagePath)) { image in
                                image.resizable()
                            } placeholder: {
                                ProgressView()
                            }
                            .scaledToFill()
                            .frame(width: 60, height: 60)
                            .clipShape(Circle())
                            .foregroundColor(.gray)
                        }

                        Text(user.username)
                            .font(.system(size: 12))
                            .foregroundColor(.primary)
                            .lineLimit(1)
                            .frame(width: 65)
                    }
                    .onTapGesture {
                        selectedUser = user
                    }
                }
            }
            .padding(.horizontal, 8)
            .padding(.vertical, 10)
        }
        .frame(height: 105)
        .fullScreenCover(item: $selectedUser) { user in
            StoryDetailView(user: user)
        }
    }
}

#Preview {
    StoryListView(container: Container.shared)
}
