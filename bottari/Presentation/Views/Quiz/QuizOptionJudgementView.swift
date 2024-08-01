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
    let action: () -> ()
    
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
                .padding(.bottom, 32)
            
            Button {
                action()
                withAnimation {
                    selectOption = nil
                    showJudgement = false
                }
            } label: {
                HStack(spacing: 10) {
                    Text("다음 퀴즈")
                        .font(.pretendBold16)
                        .foregroundStyle(.gray200)
                    Image(systemName: "arrow.right")
                        .font(.system(size: 16, weight: .medium))
                        .foregroundStyle(.gray200)
                        
                }
                .padding(.vertical, 12)
                .padding(.horizontal, 27)
                .background(RoundedRectangle(cornerRadius: 16).fill(.gray600))
            }
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
                .padding(.bottom, 19)
            
            Button {
                withAnimation {
                    selectOption = nil
                    showJudgement = false
                }
            } label: {
                HStack(spacing: 10) {
                    Image(systemName: "arrow.circlepath")
                        .font(.system(size: 16, weight: .medium))
                        .foregroundStyle(.gray200)
                    
                    Text("다시 하기")
                        .font(.pretendBold16)
                        .foregroundStyle(.gray200)
                    
                    
                }
                .padding(.vertical, 12)
                .padding(.horizontal, 27)
                .background(RoundedRectangle(cornerRadius: 16).fill(.gray600))
            }
        }
        
    }
}
