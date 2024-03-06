//
//  Coin.swift
//  Slot777
//
//  Created by Sirac Seyidov on 10.02.2024.
//

import Foundation
import SwiftUI

struct Coin: Identifiable {
    let id = UUID()
    var position: CGPoint
    var speed: CGFloat
    var size: CGSize
}
