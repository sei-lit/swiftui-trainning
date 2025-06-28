//
//  ResultView.swift
//  Gacha
//
//  Created by 大森青 on 2025/06/29.
//

import SwiftUI

struct ResultView: View {
    @Environment(\.dismiss) var dismiss
    
    @State var backGroundImageName: String = "bgRed"
    @State var characterImageName: String = "iphone"
    @State var star: String = "⭐️⭐️"
    var body: some View {
        ZStack {
            Image(backGroundImageName)
                .resizable()
                .ignoresSafeArea()
            Image(characterImageName)
                .resizable()
                .scaledToFit()
                .frame(width: 350, height: 350)
                .offset(y: -50)
            VStack {
                HStack {
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "xmark")
                            .foregroundColor(.white)
                            .font(.title)
                            .padding()
                            .background(Color.black.opacity(0.5))
                            .clipShape(Circle())
                    }
                    Spacer()
                }
                .padding(.horizontal, 20)
                Spacer()
                Text(star)
                    .font(.largeTitle)
                    .padding(.bottom, 50)
            }
        }
        .onAppear {
            let number = Int.random(in: 0..<9)
            switch number {
            case 9:
                backGroundImageName = "bgBlue"
                characterImageName = "IoTMesh"
                star = "⭐️⭐️⭐️⭐️⭐️"
            case 8:
                backGroundImageName = "bgGreen"
                characterImageName = "camera"
                star = "⭐️⭐️⭐️⭐️"
            case 0..<7:
                backGroundImageName = "bgRed"
                characterImageName = "iphone"
                star = "⭐️⭐️"
            default:
                backGroundImageName = ""
                characterImageName = ""
                star = ""
            }
        }
    }
}

#Preview {
    ResultView()
}
