//
//  SpinView.swift
//  Slot777
//
//  Created by Sirac Seyidov on 8.02.2024.
//

import SwiftUI

struct SpinView: View {
    var body: some View {
        VStack{
            Text("7")
                .foregroundColor(Colors().cartFg)
                .font(.system(size: 16))
                .fontWeight(.semibold)
        }
        .frame(width: 60, height: 120)
        .background(Colors().cartBg.opacity(0.7))
        .cornerRadius(6)
        .border(Colors().cartFg.opacity(0.9), width: 1)
        .cornerRadius(12)
    }
}

#Preview {
    SpinView()
}
