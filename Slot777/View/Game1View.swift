//
//  Game1View.swift
//  Slot777
//
//  Created by Sirac Seyidov on 28.01.2024.
//

import SwiftUI
import AVKit

struct Game1View: View {
    @State private var reels: [[String]] = [
        ["", "", "", ""],
        ["", "", "", ""],
        ["", "", "", ""]
    ]
    @State private var spinCount = 0
    let w  = UIScreen.main.bounds.width
    let h = UIScreen.main.bounds.height
    @State private var winStatus = false
    @StateObject private var spinManager = AudioManager(soundFileName: "spin_sound", loops: 1)
    @StateObject private var jackpotManager = AudioManager(soundFileName: "jackpot_sound", loops: 1)
    let soundState: Bool
    
    let player = AVPlayer(url: Bundle.main.url(forResource: "coin_rain", withExtension: "mp4")!)
    let playerLayer = AVPlayerLayer()
    @State private var creditScore: Int = UserDefaults.standard.integer(forKey: "credits")
    @State private var skin: Int = UserDefaults.standard.integer(forKey: "skin")
    
    var body: some View {
        ZStack{
            VStack {
                ZStack{
                    Colors().gray
                        .frame(width: 300, height: 300)
                        .background(Colors().gray)
                    
                    HStack {
                        ForEach(0..<3) { index in
                            if index == 1{
                                Colors().red2
                                    .frame(width: 7, height: 300)
                            }
                            
                            ReelView(win: winStatus, symbols: $reels[index])
                                .padding(.horizontal, 5)
                            
                            if index == 1{
                                Colors().red2
                                    .frame(width: 7, height: 300)
                            }
                        }
                    }
                    .padding(.top, 10)
                    .padding(.bottom, 40)
                    //.padding()
                    
                    //
                    VStack{
                        VStack{
                            Spacer().frame(height: 50)
                            Text("Credits: \(creditScore)")
                                .foregroundColor(.white)
                                .font(.system(size: 18))
                                .fontWeight(.regular)
                                .padding(.vertical, 10)
                                .padding(.horizontal, 15)
                                .background(Colors().purple)
                                .cornerRadius(4)
                        }
                        .frame(width:w, height: 200)
                        
                        Spacer()
                        
                        VStack{
                            Text("Bet amount: 5")
                                .foregroundColor(.white)
                                .font(.system(size: 22))
                                .fontWeight(.semibold)
                                //.padding(.vertical, 2)
                                .background(Colors().red2.opacity(0.1))
                                .cornerRadius(12)
                            
                            Button(action: {
                                withAnimation(Animation.easeInOut(duration: 0.1).repeatCount(10)) {
                                    spinReels()
                                }
                            }) {
                                Text("Spin")
                                    .font(Font.custom("001InterstellarLog", size: 36))
                                    //.font(.system(size: 36))
                                    .fontWeight(.semibold)
                                    .foregroundColor(.white)
                                    .frame(width: w*0.9, height: w*0.28)
                                    .cornerRadius(18)
                            }
                            
                            Spacer()
                        }
                        .frame(width:w, height: 200)
                        .padding(.bottom, 15)
                    }
                    .background(
                        Image("slot_machine_asset_3_2")
                            .resizable()
                            //.padding(.top, 20)
                    )
                    //
                    
                    if winStatus{
                        VStack{
                            //
                            CombinedText()
                                .padding()
                                .padding()
                            //
                        }
                        .background(.black.opacity(0.7))
                        .cornerRadius(12)
                    }
                    
                    //CoinRain
                    if winStatus{
                        CoinSplashView()
                    }
                    //CoinRain
                }
                
                Spacer()
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
        .onAppear{
            skin = UserDefaults.standard.integer(forKey: "skin")
            if skin == 0{
                reels = [
                    ["orange_asset", "grapes_asset", "strawberry_asset", "seven_asset_5"],
                    ["orange_asset", "grapes_asset", "strawberry_asset", "seven_asset_5"],
                    ["orange_asset", "grapes_asset", "strawberry_asset", "seven_asset_5"]
                ]
            }else if skin == 1{
                reels = [
                    ["blue_candy_asset", "red_candy_asset", "green_candy_asset", "candy_asset"],
                    ["blue_candy_asset", "red_candy_asset", "green_candy_asset", "candy_asset"],
                    ["blue_candy_asset", "red_candy_asset", "green_candy_asset", "candy_asset"]
                ]
            }
            
            creditScore = UserDefaults.standard.integer(forKey: "credits")
        }
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
        if reels[0][0] == reels[0][1] && reels[0][1] == reels[0][2] {
            creditScore += 50
            UserDefaults.standard.set(creditScore, forKey: "credits")
            winStatus = true
            if soundState{
                jackpotManager.playSound()
            }else{
                jackpotManager.stopSound()
            }
            print("You win! 1")
        }else if reels[1][0] == reels[1][1] && reels[1][1] == reels[1][2] {
            creditScore += 50
            UserDefaults.standard.set(creditScore, forKey: "credits")
            winStatus = true
            if soundState{
                jackpotManager.playSound()
            }else{
                jackpotManager.stopSound()
            }
            print("You win! 2")
        }else if reels[2][0] == reels[2][1] && reels[2][1] == reels[2][2] {
            creditScore += 50
            UserDefaults.standard.set(creditScore, forKey: "credits")
            winStatus = true
            if soundState{
                jackpotManager.playSound()
            }else{
                jackpotManager.stopSound()
            }
            print("You win! 3")
        }else if reels[0][0] == reels[1][0] && reels[1][0] == reels[2][0] {
            creditScore += 50
            UserDefaults.standard.set(creditScore, forKey: "credits")
            winStatus = true
            if soundState{
                jackpotManager.playSound()
            }else{
                jackpotManager.stopSound()
            }
            print("You win! 4")
        }else if reels[0][1] == reels[1][1] && reels[1][1] == reels[2][1] {
            creditScore += 50
            UserDefaults.standard.set(creditScore, forKey: "credits")
            winStatus = true
            if soundState{
                jackpotManager.playSound()
            }else{
                jackpotManager.stopSound()
            }
            print("You win! 5")
        }else if reels[0][2] == reels[1][2] && reels[1][2] == reels[2][2] {
            creditScore += 50
            UserDefaults.standard.set(creditScore, forKey: "credits")
            winStatus = true
            if soundState{
                jackpotManager.playSound()
            }else{
                jackpotManager.stopSound()
            }
            print("You win! 6")
        }else if reels[0][0] == reels[1][1] && reels[1][1] == reels[2][2] {
            creditScore += 50
            UserDefaults.standard.set(creditScore, forKey: "credits")
            winStatus = true
            if soundState{
                jackpotManager.playSound()
            }else{
                jackpotManager.stopSound()
            }
            print("You win! 7")
        }else if reels[0][2] == reels[1][1] && reels[1][1] == reels[2][0] {
            creditScore += 50
            UserDefaults.standard.set(creditScore, forKey: "credits")
            winStatus = true
            if soundState{
                jackpotManager.playSound()
            }else{
                jackpotManager.stopSound()
            }
            print("You win! 8")
        }else {
            UserDefaults.standard.set(creditScore, forKey: "credits")
            winStatus = false
            print("Try again!")
        }
    }
}

#Preview {
    Game1View(soundState: true)
}
