//
//  JournalSelectionView.swift
//  bottari
//
//  Created by 장수민 on 8/1/24.
//

import SwiftUI

struct JournalSelectionView: View {
    @Environment(\.dismiss) var dismiss
    @StateObject var viewModel = JournalSelectionViewModel()
    
    var body: some View {
        ZStack(alignment: .top) {
            Color.gray200
            
            VStack(alignment: .leading) {
                ZStack(alignment: .center) {
                    Text("기억 주제 고르기")
                        .font(.pretendBold16)
                        .foregroundStyle(Color.gray500)
                    HStack {
                        Image(systemName: "arrow.left")
                            .font(.title)
                            .foregroundColor(Color.black)
                            .onTapGesture {
                                dismiss()
                            }
                        Spacer()
                    }
                }
                .padding(.bottom, 40)

                
                ForEach(viewModel.getRandomTopics(count: 2), id: \.self) { topic in
                    NavigationLink(destination: JournalEntryView(topic: topic)) {
                        TopicRectangleView(topic: topic, style: .withTopic)
                    }
                    
                }
            
                DividerWithLabel(label: "또는", padding: 11, color: Color.gray400, isVertical: false)
                    .padding(.vertical, 3)
                
                NavigationLink(destination: JournalEntryView()) {
                    TopicRectangleView(topic: "자유롭게 쓰기", style: .withoutTopic)
                }
                
            }
            .padding(.top, 64)
            .padding(.horizontal, 24)
        }
        .ignoresSafeArea()
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    JournalSelectionView()
}

