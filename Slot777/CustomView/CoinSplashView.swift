//
//  CoinSplashView.swift
//  Slot777
//
//  Created by Sirac Seyidov on 28.02.2024.
//

import SwiftUI

struct CoinSplashView: View {
    let w = UIScreen.main.bounds.width
    let h = UIScreen.main.bounds.height
    @State private var coin1End = false
    @State private var coin2End = false
    @State private var coin3End = false
    @State private var randomW = 0.0
    @State private var randomH = 0.0
    @State private var numberOfTimes = 5
    
    var body: some View {
        ZStack{
            ForEach(0..<numberOfTimes, id: \.self){_ in
                CoinSView(x: randomW, y: h)
                    .position(x: randomW, y: randomH)
            }
        }
        .onAppear {
            Timer.scheduledTimer(withTimeInterval: 0.05, repeats: true) { timer in
                numberOfTimes += 1
                self.randomW = CGFloat.random(in: -w/2...w)
                self.randomH = CGFloat.random(in: 10...100)
            }
        }
    }
}

struct CoinSView: View {
    let w = UIScreen.main.bounds.width
    let h = UIScreen.main.bounds.height
    @State private var shouldAnimate = false
    let x: CGFloat
    let y: CGFloat
    
    var body: some View {
        Image("dollar")
            .resizable()
            .frame(width: 100, height: 100)
            .aspectRatio(contentMode: .fit)
            .foregroundColor(.yellow)
            //.scaleEffect(shouldAnimate ? 1.5 : 1.0)
            .offset(x: shouldAnimate ? x : 0, y: shouldAnimate ? y : 0)
            .animation(Animation.easeInOut(duration: 1.5))
            .onAppear {
                self.shouldAnimate.toggle()
            }
    }
}

#Preview {
    CoinSplashView()
}
