//
//  AddWordView.swift
//  WordList
//
//  Created by 大森青 on 2025/06/29.
//

import SwiftUI
import SwiftData

struct AddWordView: View {
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var modelContext
    @State var english: String = ""
    @State var japanese: String = ""
    @State var showAlert: Bool = false
    
    var body: some View {
        VStack(spacing: 16) {
            Spacer()
            
            TextField("英単語", text: $english)
                .textFieldStyle(.roundedBorder)
            TextField("意味", text: $japanese)
                .textFieldStyle(.roundedBorder)
            Button {
                save()
            } label: {
                Text("保存")
            }
            .font(.title)
            .foregroundStyle(.white)
            .padding(.vertical, 12)
            .frame(maxWidth: .infinity)
            .background(Color.orange)
            .clipShape(.capsule)
            
            Spacer()
        }
        .padding()
        .alert("両方の欄に入力してください", isPresented: $showAlert) {
            Button("OK", role: .cancel) {}
        }
    }
    
    func save() {
        if english.isEmpty || japanese.isEmpty {
            showAlert = true
            return
        }
        
        let word = Word(english: english, japanese: japanese)
        modelContext.insert(word)
        dismiss()
    }
}

#Preview {
    AddWordView()
}
