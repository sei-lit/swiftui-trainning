//
//  ContentView.swift
//  ListApp
//
//  Created by 大森青 on 2025/06/28.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            List {
                ForEach(Animal.allCases, id: \.self) { animal in
                    NavigationLink(destination: DetailView(animal: animal)) {
                        HStack {
                            Image(animal.iconName)
                            Text(animal.name)
                        }
                    }
                }
            }
        }
        .navigationTitle("動物")
    }
}

#Preview {
    ContentView()
}
