//
//  LuckView.swift
//  Slot777
//
//  Created by Sirac Seyidov on 19.02.2024.
//

import SwiftUI

struct GoodLuckView: View {
    var body: some View {
        VStack{
            OutlinedTextView(text: "LUCKY", color: Colors().cartFg, outlineColor: .white, fontSize: 48)
            
            ZStack{
                HStack{
                    Spacer().frame(width: 80)
                    CardView(t: "S", i: "suit.heart.fill", a: -15)
                    Spacer()
                }
                HStack{
                    Spacer().frame(width: 140)
                    CardView(t: "L", i: "suit.club.fill", a: -15)
                    Spacer()
                }
                HStack{
                    Spacer().frame(width: 200)
                    CardView(t: "O", i: "suit.diamond.fill", a: -15)
                    Spacer()
                }
                HStack{
                    Spacer().frame(width: 260)
                    CardView(t: "T", i: "suit.spade.fill", a: -15)
                    Spacer()
                }
            }
        }
    }
}

#Preview {
    GoodLuckView()
}
