//
//  KeyboardResponder.swift
//  bottari
//
//  Created by 장수민 on 8/1/24.
//

import Foundation
import SwiftUI
import Combine

class KeyboardResponder: ObservableObject {
    @Published var currentHeight: CGFloat = 0
    @Published var animationDuration: Double = 0.25

    private var cancellables = Set<AnyCancellable>()

    init() {
        let willShow = NotificationCenter.default.publisher(for: UIResponder.keyboardWillShowNotification)
        let willHide = NotificationCenter.default.publisher(for: UIResponder.keyboardWillHideNotification)
        
        Publishers.Merge(willShow, willHide)
            .receive(on: RunLoop.main)
            .sink { [weak self] notification in
                guard let self = self else { return }
                
                if let userInfo = notification.userInfo {
                    let endFrame = (userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue
                    let duration = (userInfo[UIResponder.keyboardAnimationDurationUserInfoKey] as? NSNumber)?.doubleValue ?? 0.25
                    let animationCurve = UIView.AnimationCurve(rawValue: userInfo[UIResponder.keyboardAnimationCurveUserInfoKey] as? Int ?? 0) ?? .easeInOut
                    
                    let height = (endFrame?.height ?? 0) * (notification.name == UIResponder.keyboardWillHideNotification ? 0 : 1)
                    
                    withAnimation(.timingCurve(0.2, 0.8, 0.2, 1, duration: duration)) {
                        self.currentHeight = height
                    }
                    self.animationDuration = duration
                }
            }
            .store(in: &cancellables)
    }
}
