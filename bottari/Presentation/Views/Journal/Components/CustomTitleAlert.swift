//
//  CustomTitleAlert.swift
//  bottari
//
//  Created by 장수민 on 8/2/24.
//

import SwiftUI
import UIKit

struct CustomTitleAlert: View {
    let dismissButton: CustomAlertButton?
    let primaryButton: CustomAlertButton?
    @State private var opacity: CGFloat = 0
    @State private var backgroundOpacity: CGFloat = 0
    @State private var scale: CGFloat = 1.0

    var body: some View {
        ZStack {
            alertView
        }
        .ignoresSafeArea()
    }

    private var alertView: some View {
        VStack(spacing: 0) {
            contentView
                .padding(.bottom)
            buttonsView
        }

        .padding(.top, 32)
        .padding(.bottom, 13)
        .background(Color.gray100)
        .cornerRadius(24)
    }

    @ViewBuilder
    private var contentView: some View {
        VStack {
            Text("작성을 그만하시겠어요?")
                .foregroundColor(Color.gray600)
                .font(.pretendBold20)
                .frame(maxWidth: .infinity, alignment: .center)
                .padding(.bottom, 4)
            
            Text("작성된 내용이 저장되지 않아요.")
                .foregroundStyle(Color.gray600)
                .font(.pretendMedium16)
                .frame(maxWidth: .infinity, alignment: .center)
        }
    }

    private var buttonsView: some View {
        HStack(spacing: 0) {
            primaryButtonView
                .padding(.horizontal)
            Spacer()
            if let dismissButton = dismissButton {
                dismissButtonView
                    .padding(.horizontal)
            }
        }
    }

    @ViewBuilder
    private var primaryButtonView: some View {
        if let button = primaryButton {
            CustomAlertButton(title: button.title) {
                DispatchQueue.main.asyncAfter(deadline: .now()) {
                    button.action?()
                }
            }
            .foregroundColor(Color.gray600)
            .font(.pretendMedium16)
        }
    }

    @ViewBuilder
    private var dismissButtonView: some View {
        if let button = dismissButton {
            CustomAlertButton(title: button.title) {
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                    button.action?()
                }
            }
            .foregroundColor(Color.red)
            .font(.pretendMedium16)
        }
    }

    private func animate(isShown: Bool, completion: (() -> Void)? = nil) {
        switch isShown {
        case true:
            opacity = 1
            withAnimation(.spring(response: 0.3, dampingFraction: 0.9, blendDuration: 0).delay(0.5)) {
                backgroundOpacity = 1
                scale = 1
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                completion?()
            }
        case false:
            withAnimation(.easeOut(duration: 0.2)) {
                backgroundOpacity = 0
                opacity = 0
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                completion?()
            }
        }
    }
}

struct CustomAlertButton: View {
    let title: LocalizedStringResource
    var action: (() -> Void)?

    var body: some View {
        Button {
            action?()
        } label: {
            Text(title)
                .multilineTextAlignment(.center)
                .padding(.vertical)
                .frame(maxWidth: .infinity)
        }
    }
}
