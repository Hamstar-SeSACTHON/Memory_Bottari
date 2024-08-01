//
//  MemoryCard.swift
//  bottari
//
//  Created by 송지혁 on 8/1/24.
//

import SwiftUI

struct MemoryCard: View {
    let memory: Memory
    
    var body: some View {
        HStack(spacing: 0) {
            VStack(alignment: .leading, spacing: 0) {
                date
                    .padding(.bottom, 8)
                
                Text(memory.title)
                    .font(.pretendBold18)
                    .foregroundStyle(.gray600)
                    .padding(.bottom, 4)
                
                Text(memory.content)
                    .font(.pretendMedium16)
                    .foregroundStyle(.gray500)
            }
            .padding(20)
            
            Spacer()
        }
        .frame(maxWidth: .infinity, minHeight: 119, maxHeight: 119)
        .background(background)
    }
    
    private var date: some View {
        HStack(spacing: 8) {
            Text(memory.date.description)
                .font(.pretendMedium14)
                .foregroundStyle(.gray400)
        }
    }
    private var background: some View {
        RoundedRectangle(cornerRadius: 24)
            .fill(.gray200)
    }
}

#Preview {
    MemoryCard(memory: Memory(date: Date(), image: "", title: "타이틀 폰트 사이즈 20에서 18로 변경 결과", content: "기억 본문입니다 쏘니아가 검정색 옷을 입고...", isBookmarked: false, tags: []))
}
