//
//  PlayView.swift
//  Slot777
//
//  Created by Sirac Seyidov on 19.02.2024.
//

import SwiftUI

struct PlayView: View {
    var body: some View {
        ZStack(alignment: .center){
            HStack{
                Spacer().frame(width: 70)
                PlayCoinView(t: "P")
                Spacer()
            }
            HStack{
                Spacer().frame(width: 130)
                PlayCoinView(t: "L")
                Spacer()
            }
            HStack{
                Spacer().frame(width: 190)
                PlayCoinView(t: "A")
                Spacer()
            }
            HStack{
                Spacer().frame(width: 250)
                PlayCoinView(t: "Y")
                Spacer()
            }
        }
    }
}

struct PlayCoinView: View {
    let t: String
    var body: some View {
        ZStack{
            Circle()
                .frame(width: 80, height: 80)
                .foregroundStyle(CoinColors().border1)
            Circle()
                .frame(width: 75, height: 75)
                .foregroundStyle(CoinColors().border2)
            Circle()
                .frame(width: 65, height: 65)
                .foregroundStyle(CoinColors().fill1)
            Text(t)
                .font(Font.custom("001InterstellarLog", size: 48))
                .fontWeight(.bold)
                .foregroundStyle(CoinColors().fill2)
        }
    }
}

#Preview {
    PlayView()
}
