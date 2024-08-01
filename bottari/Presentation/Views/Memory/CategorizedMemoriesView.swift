//
//  CategorizedMemoriesView.swift
//  bottari
//
//  Created by 송지혁 on 8/1/24.
//

import SwiftUI

struct CategorizedMemoriesView: View {
    @Environment(\.dismiss) var dismiss
    let memories: [Memory]
    
    var body: some View {
        VStack(spacing: 0) {
            Rectangle()
                .fill(.gray300)
                .frame(height: 235)
                .overlay(alignment: .leading) { header }
            
            Rectangle()
                .fill(.gray100)
                .overlay { memorylist }
        }
        .navigationBarBackButtonHidden()
        .ignoresSafeArea()
    }
    
    private var header: some View {
        VStack(alignment: .leading) {
            Image(systemName: "arrow.left")
                .font(.system(size: 24, weight: .regular))
                .padding(.vertical, 16)
                .onTapGesture { dismiss() }
            
            Text("어떤 기억을 찾을까요?")
                .font(.pretendBold28)
                .foregroundStyle(.gray600)
                .lineSpacing(6)
                .frame(width: 128)
        }
        .padding(.horizontal, 24)
    }
    
    private var memorylist: some View {
        Memorylist(memories: memories)
            .padding(.horizontal, 24)
    }
}
