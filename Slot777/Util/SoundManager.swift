//
//  SoundManager.swift
//  Slot777
//
//  Created by Sirac Seyidov on 5.02.2024.
//

import Foundation
import AVKit
import AVFoundation

class AudioManager: ObservableObject {
    var audioPlayer: AVAudioPlayer?
    let soundFileName: String
    let loops: Int
    
    init(soundFileName: String, loops: Int) {
        self.soundFileName = soundFileName
        self.loops = loops
        
        // Load the sound file
        if let soundURL = Bundle.main.url(forResource: soundFileName, withExtension: "mp3") {
            do {
                // Initialize the audio player
                audioPlayer = try AVAudioPlayer(contentsOf: soundURL)
                audioPlayer?.numberOfLoops = loops
            } catch {
                print("Error loading sound file: \(error.localizedDescription)")
            }
        }
    }

    func playSound() {
        audioPlayer?.play()
    }
    
    func stopSound() {
        audioPlayer?.stop()
    }
}
