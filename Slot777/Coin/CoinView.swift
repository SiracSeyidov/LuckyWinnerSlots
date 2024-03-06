//
//  CoinView.swift
//  Slot777
//
//  Created by Sirac Seyidov on 10.02.2024.
//

import Foundation
import SwiftUI

struct CoinView: View {
    var coin: Coin
    
    var body: some View {
        Image(systemName: "circle.fill")
            .foregroundColor(.yellow)
            .frame(width: coin.size.width, height: coin.size.height)
            .position(coin.position)
    }
}
