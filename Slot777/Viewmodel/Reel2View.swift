//
//  Reel2View.swift
//  Slot777
//
//  Created by Sirac Seyidov on 8.02.2024.
//

import SwiftUI

struct Reel2View: View {
    let win: Bool
    @Binding var symbols: [String]
    
    var body: some View {
        VStack {
            ForEach(symbols, id: \.self) { symbol in
                Image(symbol)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding(5)
                    .frame(width: 50, height: 70)
            }
        }
        //.background(win ? Color.white : Color.black)
    }
}
