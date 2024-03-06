//
//  CenteredShheetView.swift
//  Slot777
//
//  Created by Sirac Seyidov on 19.02.2024.
//

import Foundation
import SwiftUI

struct CenteredSheetView: View {
    var body: some View {
        Text("This is a centered sheet")
            .padding()
            .background(Color.secondary)
            .cornerRadius(10)
            .padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
            .background(Color.black.opacity(0.5))
    }
}
