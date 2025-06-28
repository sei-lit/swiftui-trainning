//
//  GameView.swift
//  Shake
//
//  Created by 大森青 on 2025/06/29.
//

import SwiftUI
import AVFoundation

struct GameView: View {
    @StateObject private var shakeDetector = ShakeDetector()
    @State private var bubbleAudioPlayer: AVAudioPlayer!
    @State private var boomAudioPlayer: AVAudioPlayer!
    
    @State var limit = Int.random(in: 90...150)
    @State var yScale: CGFloat = 1
    @State var xScale: CGFloat = 1
    @State var isGameOver: Bool = false
    
    var body: some View {
        Group {
            if !isGameOver {
                Image("bottle")
                    .resizable()
                    .frame(width: 150, height: 450)
                    .scaleEffect(x: xScale, y: yScale)
            } else {
                VStack(spacing: 40) {
                    Image("gameover")
                        .resizable()
                        .scaledToFit()
                    Text("Game Over!")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundStyle(.red)
                    
                    Button("もう一度") {
                        restartGame()
                    }
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundStyle(.white)
                    .frame(width: 250, height: 70)
                    .background(Color.blue)
                    .clipShape(.rect(cornerRadius: 20))
                }
                .padding(.horizontal, 20)
            }
        }
        .navigationBarBackButtonHidden()
        .onAppear {
            bubbleAudioPlayer = try! AVAudioPlayer(data: NSDataAsset(name: "bubble")!.data)
            bubbleAudioPlayer.prepareToPlay()
            boomAudioPlayer = try! AVAudioPlayer(data: NSDataAsset(name: "boom")!.data)
            boomAudioPlayer.prepareToPlay()
        }
        .onChange(of: shakeDetector.shakeCount) {
            if shakeDetector.shakeCount >= limit && !isGameOver {
                playSoundAndHaptic()
                let scale = CGFloat(shakeDetector.shakeCount) / CGFloat(limit)
                xScale = 1 + scale * 1.5
                yScale = 1 + scale
            } else {
                gameOver()
            }
        }
    }
    
    func playSoundAndHaptic() {
        bubbleAudioPlayer.currentTime = 0
        bubbleAudioPlayer.play()
        
        let generator = UIImpactFeedbackGenerator(style: .rigid)
        generator.impactOccurred()
    }
    
    func gameOver() {
        isGameOver = true
        boomAudioPlayer.currentTime = 0
        boomAudioPlayer.play()
        
        for i in 0..<6 {
            DispatchQueue.main.asyncAfter(deadline: .now() + Double(i) * 0.5) {
                AudioServicesPlaySystemSound(kSystemSoundID_Vibrate) // Play system sound for visual feedback
            }
        }
    }
    
    func restartGame() {
        isGameOver = false
        shakeDetector.shakeCount = 0
        limit = Int.random(in: 90...150)
        yScale = 1
        xScale = 1
    }
    
}

#Preview {
    GameView()
}
