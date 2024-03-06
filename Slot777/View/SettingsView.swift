//
//  SettingsView.swift
//  Slot777
//
//  Created by Sirac Seyidov on 5.02.2024.
//

import SwiftUI

struct SettingsView: View {
    @State private var isSoundOn = true
    @State private var isMusicOn = true
    @StateObject private var music = AudioManager(soundFileName: "background_music", loops: 0)
    
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Sound Settings")) {
                    Toggle("Sound", isOn: $isSoundOn)
                }.padding()
                
                Section(header: Text("Music Settings")) {
                    Toggle("Music", isOn: $isMusicOn)
                }.padding()
            }
            .background(.gray.opacity(0.01))
            .padding(.horizontal)
            .listStyle(GroupedListStyle())
            .navigationBarTitle("Settings")
        }
        .background(.clear)
    }
    
    private func handleSoundToggle(_ isSoundOn: Bool) {
        if isSoundOn {
            //music.playSound()
            print("Sound is turned on")
        } else {
            ContentView().musicManager.stopSound()
            print("Sound is turned off")
        }
    }
}

#Preview {
    SettingsView()
}
