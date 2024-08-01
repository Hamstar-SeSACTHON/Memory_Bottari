//
//  MemoryView.swift
//  bottari
//
//  Created by 송지혁 on 7/21/24.
//

import SwiftUI

struct MemoryView: View {
    @EnvironmentObject var navigationManager: NavigationManager
    
    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                header
                    .padding(.top, 28)
                memorylist
            }
            .padding(.horizontal, 24)
        }
    }
    
    private var header: some View {
        HStack {
            Text("기억 기록")
                .font(.pretendBold24)
                .foregroundStyle(.gray600)
            Spacer()
            Image(systemName: "magnifyingglass")
                .font(.system(size: 24, weight: .semibold))
                .foregroundStyle(.gray600)
                .onTapGesture {
                    navigationManager.screenPath.append(.search)
                }
            
            
        }
    }
    private var memorylist: some View {
        VStack(spacing: 12) {
            ForEach(0..<4, id: \.self) { _ in
                MemoryCard(memory: Memory(date: Date(), image: "", title: "타이틀 폰트 사이즈 20에서 18로 변경 결과", content: "기억 본문입니다 쏘니아가 검정색 옷을 입고...", isBookmarked: false, tags: []))
            }
        }
    }
}

#Preview {
    MemoryView()
}

