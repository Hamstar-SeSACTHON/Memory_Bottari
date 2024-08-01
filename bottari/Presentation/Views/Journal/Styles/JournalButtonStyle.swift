//
//  JournalButtonStyle.swift
//  bottari
//
//  Created by 장수민 on 8/1/24.
//

import SwiftUI

struct JournalButtonStyle: ButtonStyle {
    let scaledAmount: CGFloat
    var isEnabled: Bool
    
    init(scaledAmount: CGFloat = 0.99, isEnabled: Bool = true) {
        self.scaledAmount = scaledAmount
        self.isEnabled = isEnabled
    }

    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundColor(.white)
            .font(.pretendBold16)
            .padding(.horizontal, 12)
            .padding(.vertical, 5)
            .background(
                RoundedRectangle(cornerRadius: 37.5)
                    .foregroundColor(configuration.isPressed ? .blue.opacity(0.8) : isEnabled ? .blue : .gray300)
            )
            .scaleEffect(configuration.isPressed ? scaledAmount : 1.0)
            .brightness(configuration.isPressed ? 0.05 : 0)
            .opacity(configuration.isPressed ? 0.9 : 1.0)
    }
}
