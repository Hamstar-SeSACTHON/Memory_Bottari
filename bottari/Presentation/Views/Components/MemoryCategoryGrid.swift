//
//  MemoryGrid.swift
//  bottari
//
//  Created by 송지혁 on 8/1/24.
//

import SwiftUI

struct MemoryCategoryGrid: View {
    let tag: String
    
    var body: some View {
        RoundedRectangle(cornerRadius: 24)
            .fill(.gray200)
            .aspectRatio(1, contentMode: .fit)
            .overlay(alignment: .bottomLeading) {
                Text(tag)
                    .font(.pretendBold20)
                    .foregroundStyle(.gray600)
                    .padding(20)
                    .multilineTextAlignment(.leading)
                    .frame(width: 120)
            }
    }
}

