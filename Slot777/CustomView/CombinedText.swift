//
//  CombinedText.swift
//  Slot777
//
//  Created by Sirac Seyidov on 14.02.2024.
//

import Foundation
import SwiftUI

struct CombinedText: View {
    let text = "Jackpot"
    @State private var visibleText: String = ""
    @State private var currentIndex: Int = 0
    var color: Color = Colors().yellow
    
    var body: some View {
        ZStack {
            Text(visibleText)
                .font(.system(size: 50, weight: .bold, design: .default))
                .foregroundColor(color)
                .shadow(color: color.opacity(0.1), radius: 5, x: 0, y: 0)
                .shadow(color: color.opacity(0.1), radius: 20, x: 0, y: 0)
                .overlay(
                    Text(visibleText)
                        .font(.system(size: 50, weight: .bold, design: .default))
                        .foregroundColor(color)
                        .blur(radius: 10)
                )
                .onAppear{
                    animateText()
                }
        }
    }
    
    func animateText() {
        for (index, character) in text.enumerated() {
            DispatchQueue.main.asyncAfter(deadline: .now() + Double(index)  * 0.5) {
                visibleText += String(character)
                if index == text.count - 1 {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                        resetAnimation()
                    }
                }
            }
        }
    }
    
    func resetAnimation() {
        visibleText = ""
        currentIndex = 0
        animateText()
    }
}
