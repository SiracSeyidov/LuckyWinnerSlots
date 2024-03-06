//
//  HomeView.swift
//  Slot777
//
//  Created by Sirac Seyidov on 6.02.2024.
//

import SwiftUI

struct HomeView: View {
    @State private var info: Bool = false
    @State private var settings: Bool = false
    let w  = UIScreen.main.bounds.width
    let h = UIScreen.main.bounds.height
    @StateObject var musicManager = AudioManager(soundFileName: "background_music", loops: -1)
    @State private var isSoundOn = true
    @State private var isMusicOn = true
    
    var body: some View {
        VStack{
            
        }
    }
}

#Preview {
    HomeView()
}
