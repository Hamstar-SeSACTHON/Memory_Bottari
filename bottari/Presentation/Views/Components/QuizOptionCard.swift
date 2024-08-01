//
//  QuizAnswerCard.swift
//  bottari
//
//  Created by 송지혁 on 8/1/24.
//

import SwiftUI

struct QuizAnswerCard: View {
    @State private var isTapped = false
    @Binding var selectedAnswer: String?
    let index: Int
    let option: String
    
    var selectAnimation: Animation {
        .linear(duration: 0.16)
    }
    
    var body: some View {
        VStack(spacing: 10) {
            cardNumber
            optionView
        }
        .frame(width: 109, height: 129)
        .background(background)
        .onTapGesture {
            withAnimation(selectAnimation) {
                isTapped.toggle()
                selectedAnswer = option
            }
            
        }
        
    }
    
    
    private var cardNumber: some View {
        Text(String(index))
            .font(.pretendMedium14)
            .foregroundStyle(isTapped ? .gray200 : .gray400)
    }
    private var optionView: some View {
        Text(option)
            .font(.pretendBold16)
            .foregroundStyle(isTapped ? .gray200 : .gray600)
    }
    private var background: some View {
        RoundedRectangle(cornerRadius: 16)
            .fill(isTapped ? .gray500 : .gray100)
    }
}

#Preview {
    QuizAnswerCard(selectedAnswer: .constant("친구"), index: 1, option: "친구")
}
