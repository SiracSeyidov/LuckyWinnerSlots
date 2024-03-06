//
//  CartView.swift
//  Slot777
//
//  Created by Sirac Seyidov on 8.02.2024.
//

import SwiftUI

struct CardView: View {
    let t: String
    let i: String
    let a: Double
    
    var body: some View {
        VStack{
            HStack{
                Text(t)
                    .foregroundColor(Colors().cartFg)
                    .font(.system(size: 24))
                    .fontWeight(.semibold)
                    .padding(.top, 5)
                    .padding(.leading, 5)
                Spacer()
            }
            Spacer()
            HStack{
                Image(systemName: i)
                    .foregroundColor(Colors().cartFg)
                    .font(.system(size: 36))
                    .fontWeight(.semibold)
            }
            Spacer()
        }
        .frame(width: 90, height: 120)
        .background(Colors().cartBg)
        .cornerRadius(9)
        .border(.black.opacity(0.3), width: 1)
        .cornerRadius(9)
        .rotationEffect(Angle(degrees: a))
    }
}

#Preview {
    CardView(t: "A", i: "suit.spade", a: 0)
}
