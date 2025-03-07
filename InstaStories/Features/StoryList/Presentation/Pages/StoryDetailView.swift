//
//  StoryDetailView.swift
//  InstaStories
//
//  Created by Anis BOUZIANE on 07/03/2025.
//

import SwiftUI

import SwiftUI
import SwiftData

struct StoryDetailView: View {
    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) private var dismiss
    var user: User

    @State private var progress: CGFloat = 0.0
    @State private var isPaused = false
    private let storyDuration: TimeInterval = 5.0 // 5 sec per story

    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()

            AsyncImage(url: URL(string: user.imagePath)) { image in
                image.resizable()
                    .scaledToFit()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            } placeholder: {
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle())
            }

            VStack {
                progressBar

                HStack {
                    profileImage
                    Text(user.username)
                        .font(.headline)
                        .foregroundColor(.white)

                    Spacer()
                }
                .padding(.horizontal)

                Spacer()
            }
        }
        .onAppear {
            markAsSeen()
            startProgress()
        }
        .onTapGesture {
            dismiss()
        }
        .simultaneousGesture(
            LongPressGesture().onEnded { _ in
                isPaused.toggle()
            }
        )
    }

    private var progressBar: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                Rectangle()
                    .frame(width: geometry.size.width, height: 3)
                    .opacity(0.3)
                    .foregroundColor(.gray)

                Rectangle()
                    .frame(width: geometry.size.width * progress, height: 3)
                    .foregroundColor(.white)
                    .animation(.linear(duration: storyDuration), value: progress)
            }
        }
        .frame(height: 3)
        .padding(.horizontal)
    }

    private var profileImage: some View {
        Circle()
            .frame(width: 40, height: 40)
            .overlay(
                AsyncImage(url: URL(string: user.imagePath)) { image in
                    image.resizable()
                        .scaledToFill()
                        .clipShape(Circle())
                } placeholder: {
                    ProgressView()
                }
            )
    }

    private func markAsSeen() {
        guard !user.seen else { return }
        user.seen = true
        try? modelContext.save()
    }

    private func startProgress() {
        Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { timer in
            if progress >= 1.0 {
                dismiss() // Auto-close when progress finishes
                timer.invalidate()
            }
            if !isPaused {
                progress += 0.1 / CGFloat(storyDuration)
            }
        }
    }
}

