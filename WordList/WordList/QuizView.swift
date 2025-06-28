//
//  QuizView.swift
//  WordList
//
//  Created by 大森青 on 2025/06/29.
//

import SwiftUI
import SwiftData

struct QuizView: View {
    
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var context
    @Query var words: [Word]
    @State var index: Int = 0
    @State var showAnswer: Bool = false
    
    var isLastQuiz: Bool {
        index + 1 >= words.count
    }
    
    var body: some View {
        VStack(spacing: 24) {
            Spacer()
            if words.isEmpty {
                Text("No words available for quiz.")
            } else {
                Text(words[index].english)
                    .font(.largeTitle)
                
                Text(showAnswer ? words[index].japanese : "-")
                    .font(.largeTitle)
                
                Button {
                    showAnswer.toggle()
                } label: {
                    Text(showAnswer ? "Hide Answer" : "Show Answer")
                }
                .font(.title)
                .foregroundStyle(.white)
                .padding(.vertical, 12)
                .frame(maxWidth: .infinity)
                .background(Color.orange)
                .clipShape(.capsule)
            }
            Spacer()
            Button {
                if isLastQuiz {
                    dismiss()
                } else {
                    index += 1
                }
            } label: {
                Text(isLastQuiz ? "Finish Quiz" : "Next")
            }
            .font(.title)
            .foregroundStyle(.white)
            .padding(.vertical, 12)
            .frame(maxWidth: .infinity)
            .background(Color.orange)
            .clipShape(.capsule)
        }
        .padding(.horizontal, 60)
    }
}

#Preview {
    QuizView()
        .modelContainer(wordContainer)
}
