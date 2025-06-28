//
//  WordPreviewContainer.swift
//  WordList
//
//  Created by 保坂篤志 on 2025/05/29.
//

import SwiftData

@MainActor
let wordContainer: ModelContainer = {
    do {
        let container = try ModelContainer(
            for: Word.self,
            configurations: ModelConfiguration(isStoredInMemoryOnly: true)
        )
        let modelContext = container.mainContext
        
        if try modelContext.fetch(FetchDescriptor<Word>()).isEmpty {
            modelContext.insert(Word(english: "dog", japanese: "犬"))
            modelContext.insert(Word(english: "cat", japanese: "猫"))
        }
        
        return container
    } catch {
        fatalError(error.localizedDescription)
    }
}()
