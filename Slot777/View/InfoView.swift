//
//  InfoView.swift
//  Slot777
//
//  Created by Sirac Seyidov on 28.01.2024.
//

import SwiftUI

struct InfoView: View {
    @State private var currentPage = 0
    let pageCount = 5
    let pageTexts = [Constants().pg1, Constants().pg2, Constants().pg3, Constants().pg4, Constants().pg5]
    
    var body: some View {
        VStack{
            TabView(selection: $currentPage) {
                ForEach(0..<pageCount) { index in
                    Text(pageTexts[index])
                        .font(.body)
                        .tag(index)
                        .padding()
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
            
            HStack {
                Button(action: {
                    withAnimation {
                        currentPage = max(currentPage - 1, 0)
                    }
                }) {
                    Image(systemName: "arrow.left")
                        .foregroundColor(.yellow)
                        .padding()
                }
                .disabled(currentPage == 0)
                
                Spacer()
                
                Button(action: {
                    withAnimation {
                        currentPage = min(currentPage + 1, pageCount - 1)
                    }
                }) {
                    Image(systemName: "arrow.right")
                        .foregroundColor(.yellow)
                        .padding()
                }
                .disabled(currentPage == pageCount - 1)
            }
            .padding()
        }
        .background(.clear)
    }
}

#Preview {
    InfoView()
}
