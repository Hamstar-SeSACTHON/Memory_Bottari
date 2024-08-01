//
//  CustomAlertModifier.swift
//  bottari
//
//  Created by 장수민 on 8/2/24.
//

import SwiftUI

struct CustomAlertModifier {
    @Binding private var isPresented: Bool
    
    private let dismissButton: CustomAlertButton?
    private let primaryButton: CustomAlertButton?
}

extension CustomAlertModifier: ViewModifier {
    func body(content: Content) -> some View {
        ZStack {
            content
            if isPresented {
                Color.black.opacity(0.5).ignoresSafeArea()
                CustomTitleAlert(dismissButton: primaryButton,
                                 primaryButton: dismissButton)
                    .zIndex(3)
                    .padding(47)
            }
        }
    }
}

extension CustomAlertModifier {
    init(dismissButton: CustomAlertButton, primaryButton: CustomAlertButton?, isPresented: Binding<Bool>) {
        self.dismissButton = dismissButton
        self.primaryButton = primaryButton
        self._isPresented = isPresented
    }
}

