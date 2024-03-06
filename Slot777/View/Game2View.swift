//
//  Game2View.swift
//  Slot777
//
//  Created by Sirac Seyidov on 28.01.2024.
//

import SwiftUI

struct Game2View: View {
    @State private var reels: [[String]] = [
        ["berry", "orange", "cherry", "lemon", "seven"],
        ["berry", "orange", "cherry", "lemon", "seven"],
        ["berry", "orange", "cherry", "lemon", "seven"],
        ["berry", "orange", "cherry", "lemon", "seven"],
        ["berry", "orange", "cherry", "lemon", "seven"]
    ]
    @State private var spinCount = 0
    @State private var creditScore = 100
    let w  = UIScreen.main.bounds.width
    let h = UIScreen.main.bounds.height
    @State private var winStatus = false
    @StateObject private var spinManager = AudioManager(soundFileName: "spin_sound", loops: 1)
    @StateObject private var jackpotManager = AudioManager(soundFileName: "jackpot_sound", loops: 1)
    let soundState: Bool
    
    var body: some View {
        ZStack{
            VStack {
                Text("Fruits rolling game")
                    .foregroundColor(.white)
                    .font(.title)
                    .padding()
                
                Spacer()
                
                ZStack{
                    HStack {
                        ForEach(0..<5) { index in
                            Reel2View(win: winStatus, symbols: $reels[index])
                                .frame(width: 50, height: 70)
                        }
                    }
                    .padding()
                    .padding(.bottom)
                    
                    VStack{
                        HStack{
                            Text("Credits: \(creditScore)")
                                .foregroundColor(.white)
                                .font(.system(size: 24))
                                .fontWeight(.semibold)
                        }
                        .frame(width:w, height: 200)
                        //.background(Color(red: 45/255, green: 52/255, blue: 54/255))
                        
                        Spacer()
                        
                        HStack{
                            VStack{
                                Spacer()
                                Text("Bet amount 5")
                                    .foregroundColor(.white)
                                    .font(.system(size: 22))
                                    .fontWeight(.medium)
                                Spacer().frame(height: 40)
                            }
                        }
                        .frame(width:w, height: 200)
                        //.background(Color(red: 45/255, green: 52/255, blue: 54/255))
                    }
                    .background(
                        Image("slot3").resizable()
                    )
                    
                    if winStatus{
                        VStack{
                            //
                            CombinedText()
                                .padding()
                                .padding()
                            //
                        }
                        .background(.black.opacity(0.9))
                        .cornerRadius(12)
                    }
                }
                
                Spacer()
                
                Button(action: {
                    withAnimation(Animation.easeInOut(duration: 0.1).repeatCount(10)) {
                        spinReels()
                    }
                }) {
                    Text("Spin")
                        .font(.title)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(10)
                }
            }
            
            if creditScore == 0{
                VStack{
                    Text("You lost  all credits, but you earned 50 credits.")
                        .foregroundColor(.white)
                        .font(.system(size: 20))
                        .fontWeight(.regular)
                        .padding()
                    
                    Button(action: {
                        creditScore += 50
                    }){
                        Text("Continue")
                            .foregroundColor(.white)
                            .font(.system(size: 18))
                            .fontWeight(.regular)
                            .padding()
                            .background(.purple)
                            .cornerRadius(12)
                    }
                }
                .padding()
                .background(.black.opacity(0.7))
                .cornerRadius(24)
            }
        }
        .background(
            Image("bg2")
                .resizable()
                .ignoresSafeArea()
        )
    }
    
    func spinReels() {
        if soundState{
            spinManager.playSound()
        }else{
            spinManager.stopSound()
        }
        if creditScore != 0{
            spinCount += 1
            creditScore -= 5
            
            reels.indices.forEach { index in
                reels[index].shuffle()
            }
            
            checkForWin()
        }else{
            
        }
    }
    
    func checkForWin() {
        if reels[0][2] == reels[1][2] && reels[1][2] == reels[2][2] {
            creditScore += 10
            winStatus = true
            if soundState{
                jackpotManager.playSound()
            }else{
                jackpotManager.stopSound()
            }
            print("You win! 1")
        }else if reels[0][3] == reels[1][3] && reels[1][3] == reels[2][3] {
            creditScore += 10
            winStatus = true
            if soundState{
                jackpotManager.playSound()
            }else{
                jackpotManager.stopSound()
            }
            print("You win! 2")
        }else if reels[0][4] == reels[1][4] && reels[1][4] == reels[2][4] {
            creditScore += 10
            winStatus = true
            if soundState{
                jackpotManager.playSound()
            }else{
                jackpotManager.stopSound()
            }
            print("You win! 3")
        }else {
            winStatus = false
            print("Try again!")
        }
    }
}

#Preview {
    Game2View(soundState: true)
}
