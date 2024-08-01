//
//  DividerWithLabel.swift
//  bottari
//
//  Created by 장수민 on 8/1/24.
//

import SwiftUI

struct DividerWithLabel: View {
    let label: String
    let padding: CGFloat
    let color: Color
    let isVertical: Bool
    
    init(label: String = "Label", padding: CGFloat = 20, color: Color = .gray, isVertical: Bool = false) {
        self.label = label
        self.padding = padding
        self.color = color
        self.isVertical = isVertical
    }
    
    var body: some View {
        Group {
            if isVertical {
                VStack {
                    dividerLine
                    Text(label).foregroundColor(color)
                        .font(.pretendMedium14)
                    dividerLine
                }
            } else {
                HStack {
                    dividerLine
                    Text(label).foregroundColor(color)
                        .font(.pretendMedium14)
                    dividerLine
                }
            }
        }
    }
    
    private var dividerLine: some View {
        Group {
            if isVertical {
                HStack {
                    Divider().background(color)
                }
            } else {
                VStack {
                    Divider().background(color)
                }
            }
        }
        .padding(padding)
    }
}

#Preview {
    DividerWithLabel(label: "또는", padding: 11, color: Color.gray300, isVertical: false)
}
