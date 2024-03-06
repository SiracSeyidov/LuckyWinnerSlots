//
//  CoinIcon.swift
//  Slot777
//
//  Created by Sirac Seyidov on 19.02.2024.
//

import Foundation
import SwiftUI

struct CoinIcon: View {
    var body: some View {
        GeometryReader { geometry in
            Path { path in
                let size = min(geometry.size.width, geometry.size.height)
                let center = CGPoint(x: size / 2, y: size / 2)
                let radius = size / 2
                
                // Outer circle
                path.addArc(center: center, radius: radius, startAngle: .zero, endAngle: .degrees(360), clockwise: false)
                
                // Inner circle
                path.addArc(center: center, radius: radius / 2, startAngle: .zero, endAngle: .degrees(360), clockwise: false)
                
                // Dollar sign symbol
                let dollarSignSize = size / 3
                let dollarSignCenter = CGPoint(x: center.x + dollarSignSize / 3, y: center.y - dollarSignSize / 3)
                path.move(to: CGPoint(x: dollarSignCenter.x, y: dollarSignCenter.y + dollarSignSize / 2))
                path.addLine(to: CGPoint(x: dollarSignCenter.x - dollarSignSize / 3, y: dollarSignCenter.y - dollarSignSize / 2))
                path.addLine(to: CGPoint(x: dollarSignCenter.x + dollarSignSize / 3, y: dollarSignCenter.y - dollarSignSize / 2))
                path.addLine(to: CGPoint(x: dollarSignCenter.x, y: dollarSignCenter.y + dollarSignSize / 2))
                path.addLine(to: CGPoint(x: dollarSignCenter.x + dollarSignSize / 2, y: dollarSignCenter.y + dollarSignSize / 3))
                path.addLine(to: CGPoint(x: dollarSignCenter.x - dollarSignSize / 2, y: dollarSignCenter.y + dollarSignSize / 3))
                path.addLine(to: CGPoint(x: dollarSignCenter.x, y: dollarSignCenter.y + dollarSignSize / 2))
            }
            .fill(Color.yellow)
        }
    }
}
