//
//  OutlinedTextView.swift
//  Slot777
//
//  Created by Sirac Seyidov on 8.02.2024.
//

import SwiftUI

struct OutlinedTextView: View {
    var text: String
    var color: Color
    var outlineColor: Color
    var fontSize: CGFloat
    
    var body: some View {
        HStack(spacing: 1) {
            ForEach(Array(text), id: \.self) { char in
                Text(String(char))
                    .font(.system(size: fontSize, weight: .bold, design: .default))
                    .foregroundColor(color)
                    .overlay(
                        Text(String(char))
                            .font(.system(size: fontSize, weight: .bold, design: .default))
                            .foregroundColor(outlineColor)
                            .offset(x: 0, y: 0)
                            .padding(.leading, -10)
                    )
            }
        }
    }
}

#Preview {
    OutlinedTextView(text: "", color: .green, outlineColor: .black, fontSize: 0)
}
