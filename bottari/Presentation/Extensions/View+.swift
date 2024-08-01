//
//  View+.swift
//  bottari
//
//  Created by 장수민 on 8/2/24.
//

import Foundation
import SwiftUI

extension View {

    func alert(title: String = "", message: String = "",
               primaryButton: CustomAlertButton, secondaryButton: CustomAlertButton,
               isPresented: Binding<Bool>) -> some View {
        let title   = NSLocalizedString(title, comment: "")
        let message = NSLocalizedString(message, comment: "")
    
        return modifier(CustomAlertModifier(dismissButton: primaryButton, primaryButton: secondaryButton,
                                            isPresented: isPresented))
    }
    
    func customButtonStyle(isEnabled: Bool) -> some View {
        self.modifier(CustomButtonModifier(isEnabled: isEnabled))
    }
}
