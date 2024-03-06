//
//  ContentView.swift
//  Slot777
//
//  Created by Sirac Seyidov on 27.01.2024.
//

import SwiftUI

struct ContentView: View {
    @State private var info: Bool = false
    @State private var settings: Bool = false
    @State private var isShop: Bool = false
    let w  = UIScreen.main.bounds.width
    let h = UIScreen.main.bounds.height
    @StateObject var musicManager = AudioManager(soundFileName: "background_music", loops: -1)
    @State private var isSoundOn = false
    @State private var isMusicOn = false
    @State private var currentPage = 0
    let pageCount = 5
    let pageTexts = [Constants().pg1, Constants().pg2, Constants().pg3, Constants().pg4, Constants().pg5]
    @State private var credits: Int = UserDefaults.standard.integer(forKey: "credits")
    
    var body: some View {
        NavigationStack{
            ZStack{
                VStack{
                    HStack{
                        HStack{
                            Text(String(credits))
                                .font(Font.custom("001InterstellarLog", size: 24))
                                .foregroundColor(.white)
                            Image("dollar")
                                .resizable()
                                .frame(width: 30, height: 30)
                        }
                        Spacer()
                        
                        NavigationLink(destination: ShopView()){
                            VStack(spacing: 5){
                                Image(systemName: "basket")
                                    .resizable()
                                    .frame(width: w/7, height: w/7)
                                    .foregroundColor(.white)
                                Text("Shop")
                                    .foregroundStyle(.white)
                                    .fontWeight(.bold)
                            }
                        }
                    }
                    .padding(.horizontal, 20)
                    .padding(.vertical, 40)
                    Spacer()
                    HStack{
                        Image("coins")
                        Spacer()
                        Image("coins")
                    }
                }
                
                //BgAnimation1()
                                
                VStack {
                    Spacer().frame(height: h/7)
                    
                    GoodLuckView()
                    
                    Spacer().frame(height: h/7)
                    
                    VStack{
                        NavigationLink(destination: Game1View(soundState: isSoundOn)){
                            PlayView()
                        }
                    }
                    
                    Spacer()
                    
                    HStack{
                        //Spacer()
                        
                        Button(action: {
                            info.toggle()
                        }){
                            HStack{
                                Image("information")
                                    .resizable()
                                    .frame(width: 100,height: 100)
                                //Text("Info")
                                    //.font(.system(size: 24))
                                    //.foregroundColor(.white)
                            }
                        }
                        
                        Spacer()
                        
                        Button(action: {
                            settings.toggle()
                        }){
                            HStack{
                                Image("settings_2")
                                    .resizable()
                                    .frame(width: 100,height: 100)
                                //Text("Settings")
                                    //.font(.system(size: 24))
                                    //.foregroundColor(.white)
                            }
                        }
                        
                        //Spacer()
                    }
                    .padding(5)
                    //.padding(.bottom, 15)
                    .background(.gray.opacity(0.2))
                    .cornerRadius(16)
                }
                .frame(width: w, height: h)
                
                if info{
                    VStack{
                        TabView(selection: $currentPage) {
                            ForEach(0..<pageCount) { index in
                                Text(pageTexts[index])
                                    .font(.body)
                                    .foregroundColor(.white)
                                    .tag(index)
                                    .padding()
                            }
                        }
                        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                        
                        HStack {
                            Button(action: {
                                withAnimation {
                                    currentPage = max(currentPage - 1, 0)
                                }
                            }) {
                                Image(systemName: "arrow.left")
                                    .foregroundColor(.yellow)
                                    .padding()
                            }
                            .disabled(currentPage == 0)
                            
                            Spacer()
                            Button(action: {
                                info.toggle()
                            }){
                                Image(systemName: "x.circle.fill")
                                    .foregroundColor(.red.opacity(0.7))
                                    .font(.system(size: 36))
                            }
                            Spacer()
                            
                            Button(action: {
                                withAnimation {
                                    currentPage = min(currentPage + 1, pageCount - 1)
                                }
                            }) {
                                Image(systemName: "arrow.right")
                                    .foregroundColor(.yellow)
                                    .padding()
                            }
                            .disabled(currentPage == pageCount - 1)
                        }
                    }
                    .frame(width: w*0.8, height: w*0.6)
                    .background(.black.opacity(0.9))
                    .cornerRadius(16)
                }
                
                if settings{
                    VStack{
                        Spacer()
                        HStack{
                            Spacer()
                            Button(action: {
                                isSoundOn.toggle()
                            }){
                                if isSoundOn{
                                    VStack{
                                        Image(systemName: "speaker.wave.2")
                                            .foregroundColor(.green)
                                            .font(.system(size: 60))
                                        Text("Sound is on")
                                            .foregroundColor(.green)
                                            .font(.system(size: 18))
                                            .padding(.top)
                                    }
                                }else{
                                    VStack{
                                        Image(systemName: "speaker.wave.2")
                                            .foregroundColor(.gray.opacity(0.5))
                                            .font(.system(size: 60))
                                        Text("Sound is off")
                                            .foregroundColor(.gray.opacity(0.5))
                                            .font(.system(size: 18))
                                            .padding(.top)
                                    }
                                }
                            }
                            Spacer()
                            Button(action: {
                                isMusicOn.toggle()
                                if isMusicOn{
                                    musicManager.playSound()
                                }else{
                                    musicManager.stopSound()
                                }
                            }){
                                if isMusicOn{
                                    VStack{
                                        Image(systemName: "music.note")
                                            .foregroundColor(.green)
                                            .font(.system(size: 60))
                                        Text("Music is on")
                                            .foregroundColor(.green)
                                            .font(.system(size: 18))
                                            .padding(.top)
                                    }
                                }else{
                                    VStack{
                                        Image(systemName: "music.note")
                                            .foregroundColor(.gray.opacity(0.5))
                                            .font(.system(size: 60))
                                        Text("Music is off")
                                            .foregroundColor(.gray.opacity(0.5))
                                            .font(.system(size: 18))
                                            .padding(.top)
                                    }
                                }
                            }
                            Spacer()
                        }
                        Spacer()
                        Button(action: {
                            settings.toggle()
                        }){
                            Image(systemName: "x.circle.fill")
                                .foregroundColor(.red.opacity(0.7))
                                .font(.system(size: 36))
                        }
                        Spacer()
                    }
                    .frame(width: w*0.8, height: w*0.6)
                    .background(.black.opacity(0.9))
                    .cornerRadius(16)
                }
            }
            .frame(width: w, height: h)
            .background(
                Image("bg2")
                    .resizable()
                    .ignoresSafeArea(.all)
            )
            .padding()
            .onAppear{
                credits = UserDefaults.standard.integer(forKey: "credits")
                if credits == 0{
                    credits = 100
                    UserDefaults.standard.set(credits, forKey: "credits")
                }
            }
        }
        .onAppear{
            musicManager.playSound()
            musicManager.stopSound()
        }
    }
    
    private func handleMusicToggle(_ isMusicOn: Bool) {
        if isMusicOn {
            musicManager.playSound()
            print("Music is turned on")
        } else {
            musicManager.stopSound()
            print("Music is turned off")
        }
    }
    private func handleSoundToggle(_ isSoundOn: Bool) {
        if isSoundOn {
            print("Music is turned on")
        } else {
            print("Music is turned off")
        }
    }
}

#Preview {
    ContentView()
}
