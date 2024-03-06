//
//  ReelView.swift
//  Slot777
//
//  Created by Sirac Seyidov on 5.02.2024.
//

import Foundation
import SwiftUI

struct ReelView: View {
    let w  = UIScreen.main.bounds.width
    let h = UIScreen.main.bounds.height
    let win: Bool
    @Binding var symbols: [String]
    
    var body: some View {
        VStack {
            ForEach(symbols, id: \.self) { symbol in
                Image(symbol)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding(5)
                    .frame(width: 60, height: 60)
            }
        }
        //.background(win ? Color.white : Color.black)
    }
}
