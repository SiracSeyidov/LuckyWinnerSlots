//
//  BoxView.swift
//  Slot777
//
//  Created by Sirac Seyidov on 28.01.2024.
//

import SwiftUI

struct BoxView: View {
    @Binding var symbol:String
    @Binding var background:Color
    
    var body: some View {
        Image(symbol)
        .resizable()
        .aspectRatio(1, contentMode: .fit)
        .background(background.opacity(0.5))
        .cornerRadius(20)
        .transition(AnyTransition.move(edge: .top))
    }
}

#Preview {
    BoxView(symbol: Binding.constant("cherry"), background: Binding.constant(Color.green))
}
