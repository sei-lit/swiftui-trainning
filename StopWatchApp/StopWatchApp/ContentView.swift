//
//  ContentView.swift
//  StopWatchApp
//
//  Created by 大森青 on 2025/06/27.
//

import SwiftUI

struct ContentView: View {
    
    @State private var timer: Timer!
    @State private var elapsedTime: Double = 0.0
    @State private var isRunning: Bool = false
    
    var body: some View {
        VStack {
            Text(String(format: "%.2f", elapsedTime))
                .font(.title)
            HStack {
                if isRunning {
                    Button {
                        pause()
                    } label: {
                        Image(systemName: "pause.fill")
                            .foregroundColor(.white)
                            .font(.title)
                            .padding()
                            .background(Color.green)
                            .clipShape(.circle)
                    }
                } else {
                    Button {
                        start()
                    } label: {
                        Image(systemName: "play.fill")
                            .foregroundColor(.white)
                            .font(.title)
                            .padding()
                            .background(Color.green)
                            .clipShape(.circle)
                    }
                }
                
                if elapsedTime != 0.0 {
                    Button {
                        stop()
                    } label: {
                        Image(systemName: "stop.fill")
                            .foregroundColor(.white)
                            .font(.title)
                            .padding()
                            .background(Color.red)
                            .clipShape(.circle)
                    }
                }
            }
        }
        .padding()
    }
    func start() {
        timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { _ in
            elapsedTime += 0.1
        }
        isRunning = true
    }
    
    func pause() {
        timer.invalidate()
        isRunning = false
    }
    
    func stop() {
        timer.invalidate()
        isRunning = false
        elapsedTime = 0.0
    }
}

#Preview {
    ContentView()
}
