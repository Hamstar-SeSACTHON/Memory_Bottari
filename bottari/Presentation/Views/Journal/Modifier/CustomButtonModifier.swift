//
//  CustomButtonModifier.swift
//  bottari
//
//  Created by 장수민 on 8/2/24.
//

import SwiftUI

struct CustomButtonModifier: ViewModifier {
    var isEnabled: Bool

    func body(content: Content) -> some View {
        content
            .foregroundColor(isEnabled ? .white : .gray)
            .background(
                RoundedRectangle(cornerRadius: 37.5)
                    .foregroundColor(isEnabled ? .blue : .gray)
            )
            .opacity(isEnabled ? 1.0 : 0.5)
            .scaleEffect(isEnabled ? 1.0 : 0.98)
    }
}

