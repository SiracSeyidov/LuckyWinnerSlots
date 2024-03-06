//
//  Slot777App.swift
//  Slot777
//
//  Created by Sirac Seyidov on 27.01.2024.
//

import SwiftUI
import AVFoundation

@main
struct Slot777App: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .onAppear{
                    for family in UIFont.familyNames.sorted() {
                        let names = UIFont.fontNames(forFamilyName: family)
                        print("Family: \(family) Font names: \(names)")
                    }
                }
        }
    }
}
