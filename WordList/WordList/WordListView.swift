//
//  WordListView.swift
//  WordList
//
//  Created by 大森青 on 2025/06/29.
//

import SwiftUI
import SwiftData

struct WordListView: View {
    
    @Environment(\.modelContext) private var modelContext
    @Query var words: [Word]
    var body: some View {
        List {
            if words.isEmpty {
                Text("No words available.")
                    
            } else {
                ForEach(words) { word in
                    HStack {
                        Text(word.english)
                        Spacer()
                        Text(word.japanese)
                    }
                }
            }
        }
        .navigationTitle("Words")
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                NavigationLink {
                    AddWordView()
                } label: {
                    Image(systemName: "plus")
                }
            }
        }
    }
}

#Preview {
    WordListView()
        .modelContainer(wordContainer)
}
