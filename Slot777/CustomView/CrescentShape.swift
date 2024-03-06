//
//  CrescentShape.swift
//  Slot777
//
//  Created by Sirac Seyidov on 19.02.2024.
//

import Foundation
import  SwiftUI

struct CrescentShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        // Center of the circle
        let center = CGPoint(x: rect.width / 2, y: rect.height)
        
        // Radius of the circle
        let radius = rect.width / 2
        
        // Starting point
        path.move(to: center)
        
        // Draw arc
        path.addArc(center: center, radius: radius, startAngle: .degrees(180), endAngle: .degrees(0), clockwise: true)
        
        return path
    }
}
