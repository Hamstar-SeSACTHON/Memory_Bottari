//
//  QuizView.swift
//  bottari
//
//  Created by 송지혁 on 8/1/24.
//

import SwiftUI

struct QuizView: View {
    @State private var selectedAnswer: String?
    @State private var showJudgement = false
    let quiz: Quiz
    
    var body: some View {
        ZStack {
            if showJudgement, let _ = selectedAnswer {
                QuizOptionJudgementView(selectOption: $selectedAnswer, showJudgement: $showJudgement, correctOption: quiz.correctOption, successMessage: quiz.successMessage)
            } else {
                quizView
            }
        }
        .frame(minHeight: 360)
        .onChange(of: selectedAnswer) { _, _ in
            guard selectedAnswer != nil else { return }
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                withAnimation {
                    showJudgement = true
                }
            }
        }
    }
    
    private var quizView: some View {
        VStack(spacing: 0) {
            quizBubble
                .padding(.bottom, 6)
            question
                .padding(.bottom, 20)
            quizOptions
            
        }
    }
    
    private var quizOptions: some View {
        HStack(spacing: 8) {
            ForEach(Array(quiz.options.enumerated()), id: \.offset) { index, option in
                QuizAnswerCard(selectedAnswer: $selectedAnswer, index: index+1, option: option)
            }
        }
        .disabled(selectedAnswer != nil)
    }
    private var quizBubble: some View {
        Image("QuizBubble")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 68)
    }
    private var question: some View {
        Text(quiz.question)
            .font(.pretendBold20)
            .foregroundStyle(.gray600)
    }
}

#Preview {
    QuizView(quiz: Quiz(date: Date(), question: "어제 누구의 생일을 축하했나요?", options: ["친구", "큰 딸 민정이", "둘째 딸 민지"], correctOption: "큰 딸 민정이", successMessage: "어제 큰 딸의 생일을 축하했어요"))
}
