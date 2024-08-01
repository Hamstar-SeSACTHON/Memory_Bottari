//
//  TopicRectangleView.swift
//  bottari
//
//  Created by 장수민 on 8/1/24.
//

import SwiftUI

struct TopicRectangleView: View {
    let topic: String
    let style: TopicStyle
    
    var body: some View {
        
        HStack {
            if style == TopicStyle.withoutTopic {
                Image(systemName: "pencil.and.scribble")
                    .foregroundStyle(style.color)
            }
            Text(topic)
                .font(.pretendBold20)
                .foregroundStyle(style.color)
            Spacer()
        }
        .frame(maxWidth: .infinity)
        .padding(24)
        .background(                RoundedRectangle(cornerRadius: 24)
            .foregroundStyle(style.backgroundColor)
        )
    }
}

#Preview {
    VStack {
        TopicRectangleView(topic: "나의 고향은?", style: .withTopic)
        TopicRectangleView(topic: "오늘 점심에 먹은 음식은?", style: .withoutTopic)
    }
}
