//
//  ContentView.swift
//  BeeBee
//
//  Created by Dan Petre on 24/2/21.
//

import SwiftUI

struct ContentView: View {
    
    @State private var beePosition = CGPoint(x: 100, y: 100)
    @State private var obstPosition = CGPoint(x: 1000, y: CGFloat.random(in: 0...500))
    @State private var isPaused: Bool = false
    @State private var start = false
    @State private var score = 0
    
    @State var timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        
        GeometryReader { geo in
            
            ZStack {


                Obstacle()
                    .position(self.obstPosition)
                    .onReceive(self.timer) { _ in
                        self.obstMove()
                    }
                
                Bee()
                    .position(self.beePosition)
                    .onReceive(self.timer) { _ in
                        self.gravity()
                        
                    }
                

                !self.isPaused ? Text("\(self.score)")
                        .padding()
                        .foregroundColor(.white)
                        .shadow(color: .white, radius: 3)
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        .position(x: geo.size.width - 100, y: geo.size.height / 10)
                    : nil

                
                self.isPaused ? Button(action: { self.resume() }, label: {
                    VStack {
                        Text("Your total score is: \(self.score)")
                            .padding()
                            .foregroundColor(.white)
                            .shadow(color: .white, radius: 3)
                            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        Text("Start Again")
                            .foregroundColor(.white)
                    }

                    }) : nil

            }
            
            .frame(width: geo.size.width, height: geo.size.height)
            .background(Color.blue)
            .gesture(
                TapGesture()
                    .onEnded{
                        withAnimation() {
                            !self.isPaused ? self.beePosition.y -= 120 : nil
                        }
                    }
            )
            .onReceive(self.timer) {_ in
                    self.collisionDetection()
                    self.score += 1
                }
        }
        .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
        // Uncomment this if you want background music while playing
//        .onAppear() {
//            Sounds.playSounds(soundfile: "mixkit-game-level-music-689.wav", numberOfLoops: 100)
//        }
        
    }
    
    func gravity() {
        withAnimation() {
            self.beePosition.y += 20

        }
    }

    func obstMove() {
            if self.obstPosition.x > 0 {
                withAnimation() {
                    self.obstPosition.x -= 20
                }
            } else {
                self.obstPosition.x = 1000
                self.obstPosition.y = CGFloat.random(in: 0...500)
            }
    }
    
    func pause() {
        self.timer.upstream.connect().cancel()
    };
    
    func resume() {
        self.timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
        
        self.obstPosition.x = 1000 // moving obstacle to the starting point
        self.beePosition = CGPoint(x: 100, y: 100)
        self.isPaused = false
        self.score = 0
        // Uncomment this if you want background music while playing
//        Sounds.playSounds(soundfile: "mixkit-game-level-music-689.wav", numberOfLoops: 100)
    }
    
    func collisionDetection() {

        if abs(beePosition.x - obstPosition.x) < (25 + 10) && abs(beePosition.y - obstPosition.y) < (25 + 100) {
            
            self.pause()
            Sounds.playSounds(soundfile: "mixkit-positive-interface-beep-221.wav")
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                self.isPaused = true
            }
        }
        
        if abs(beePosition.x - obstPosition.x) == 0 {
            Sounds.playSounds(soundfile: "mixkit-arcade-game-jump-coin-216.wav")
        }
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            
    }
}
