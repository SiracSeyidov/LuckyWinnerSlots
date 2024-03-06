//
//  GiftBoxView.swift
//  Slot777
//
//  Created by Sirac Seyidov on 28.01.2024.
//

import SwiftUI

struct GiftBoxView: View {
    var body: some View {
        Text("💝")
            .phaseAnimator([false, true]) { AirPodsMax, threeDYRotate in
                AirPodsMax
                    .rotation3DEffect(.degrees(threeDYRotate ? 0 : 360 * 5), axis: (x: 0, y: 1, z: 0))
            } animation: { threeDYRotate in
                    .linear(duration: 5).speed(0.3).repeatForever(autoreverses: false)
            }
    }
}

#Preview {
    GiftBoxView()
}
