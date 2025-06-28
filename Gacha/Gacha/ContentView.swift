//
//  ContentView.swift
//  Gacha
//
//  Created by 大森青 on 2025/06/29.
//

import SwiftUI

struct ContentView: View {
    
    @State var showSheet: Bool = false
    
    var body: some View {
        ZStack {
            Image("gacha")
                .resizable()
                .ignoresSafeArea()
            Button {
                showSheet = true
            } label: {
                Image("Presentbox")
                    .resizable()
                    .scaledToFit()
                    
            }
        }
        .fullScreenCover(isPresented: $showSheet) {
            ResultView()
        }
    }
}

#Preview {
    ContentView()
}
