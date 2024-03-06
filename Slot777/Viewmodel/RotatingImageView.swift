//
//  RotatingImageView.swift
//  Slot777
//
//  Created by Sirac Seyidov on 10.02.2024.
//

import Foundation
import SwiftUI

struct RotatingImageView: View {
    @State private var angle: Double = 0
    
    let imageName: String
    let imageSize: CGFloat
    let animationDuration: Double
    
    var body: some View {
        Image(imageName)
            .resizable()
            .frame(width: imageSize, height: imageSize)
            .rotationEffect(.degrees(angle))
            .animation(
                Animation.interpolatingSpring(duration: animationDuration)
                    .repeatForever(autoreverses: true)
                    .speed(2.5)
            )
            .onAppear {
                self.angle = 360
            }
    }
}
