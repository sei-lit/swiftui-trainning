//
//  WordListApp.swift
//  WordList
//
//  Created by 大森青 on 2025/06/29.
//

import SwiftUI
import SwiftData

@main
struct WordListApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: Word.self)
        }
    }
}
