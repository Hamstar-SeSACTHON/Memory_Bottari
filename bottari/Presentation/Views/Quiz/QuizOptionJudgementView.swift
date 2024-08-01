//
//  QuizCorrectView.swift
//  bottari
//
//  Created by 송지혁 on 8/1/24.
//

import ConfettiSwiftUI
import SwiftUI

struct QuizOptionJudgementView: View {
    @State private var counter = 0
    @Binding var selectOption: String?
    @Binding var showJudgement: Bool
    let correctOption: String
    let successMessage: String
    
    var body: some View {
        VStack(spacing: 8) {
            if selectOption == correctOption {
                correctView
            } else {
                wrongView
            }
        }
    }
    
    private var correctView: some View {
        VStack(spacing: 8) {
            Text("정답이에요!")
                .font(.pretendBold32)
                .foregroundStyle(.gray600)
            
            Text(successMessage)
                .font(.pretendMedium16)
                .foregroundStyle(.gray500)
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                counter += 1
            }
        }
        .confettiCannon(counter: $counter, num: 50, colors: [.confettiOrange, .confettiBlue, .confettiGreen])
    }
    private var wrongView: some View {
        VStack(spacing: 13) {
            Image("WrongBubble")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 80)
            
            Text("다시 한번 해봐요!")
                .font(.pretendBold32)
                .foregroundStyle(.gray600)
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                withAnimation {
                    selectOption = nil
                    showJudgement = false
                }
            }
        }
        
    }
}

#Preview {
    QuizOptionJudgementView(selectOption: .constant("안녕"), showJudgement: .constant(false), correctOption: "안녕", successMessage: "어제 큰 딸의 생일을 축하했어요!")
}
