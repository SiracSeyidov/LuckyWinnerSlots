//
//  CoinRainView.swift
//  Slot777
//
//  Created by Sirac Seyidov on 10.02.2024.
//

import SwiftUI

struct CoinRainView: View {
    @State private var animate = false
    @State private var scale: CGFloat = 1.0
    
    var body: some View {
        VStack {
            if animate {
                Text("You Win!")
                    .font(.largeTitle)
                    .scaleEffect(scale)
                    .foregroundColor(.green)
                    .animation(
                        Animation.easeInOut(duration: 1)
                            .repeatForever(autoreverses: true)
                    )
            } else {
                Button(action: {
                    withAnimation {
                        self.animate.toggle()
                        self.scale = 1.2
                    }
                }) {
                    Text("Show Win Animation")
                        .font(.title)
                        .foregroundColor(.blue)
                }
            }
        }
    }
}

#Preview {
    CoinRainView()
}
