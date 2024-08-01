//
//  JournalDetailView.swift
//  bottari
//
//  Created by 장수민 on 8/2/24.
//

import SwiftUI

struct JournalDetailView: View {
    @EnvironmentObject var appViewModel: AppViewModel
    @Environment(\.modelContext) var context
    @Environment(\.dismiss) var dismiss
    
    var memory: Memory
    
    var body: some View {
        VStack(spacing: 0) {
            ScrollView {
                VStack {
                    ZStack(alignment: .center) {
                        Text(DateFormatter.koreanDateFormatter.string(from: memory.date))
                            .font(.pretendBold16)
                            .foregroundStyle(Color.gray500)
                        HStack {
                            Image(systemName: "xmark")
                                .font(.title)
                                .foregroundColor(Color.black)
                                .onTapGesture {
                                    dismiss()
                                }
                            Spacer()
                            //                            Image(systemName: "xmark")
                            //                                .font(.title)
                            //                                .foregroundColor(Color.black)
                        }
                    }
                    .padding(.bottom, 12)
                    
                    ZStack(alignment: .center) {
                        Image("JournalBubble")
                            .resizable()
                            .scaledToFit()
                            .frame(maxWidth: .infinity)
                        Text(""+memory.title+"")
                            .font(.pretendBold20)
                            .foregroundStyle(Color.gray500)
                            .padding(.bottom, 10)
                    }
                    
                    ScrollView(.horizontal) {
                        HStack {
                            ForEach(memory.tags, id: \.self) { tag in                        Text("# "+tag)
                                    .font(.pretendMedium16)
                                    .padding(EdgeInsets(top: 4, leading: 12, bottom: 4, trailing: 12))
                                    .foregroundStyle(Color.gray100)
                                    .background(
                                        Capsule()
                                            .fill(.gray600)
                                    )
                            }
                        }
                    }
                    .padding(.vertical, 20)
                    
                    VStack {
                        Text(memory.content)
                        if let image = memory.image {
//                            ZStack(alignment: .topTrailing) {
//                                Image(uiImage: memory.image)
//                                    .resizable()
//                                    .scaledToFit()
//                                    .frame(maxWidth: .infinity)
//                                    .cornerRadius(24)
                            //TODO: 이미지
                        }
                    }
                    .padding()
                    .background(Color.gray100)
                    .cornerRadius(24)
                    .overlay(
                        RoundedRectangle(cornerRadius: 24)
                            .stroke(Color.gray.opacity(0.2), lineWidth: 1)
                    )
                    .padding(.bottom, 20)
                }
            }
        }
        .padding(.horizontal, 24)
        .background(
            Color.gray200
            
        )
    }
}

#Preview {
    JournalDetailView(memory: Memory(
        id: UUID(),
        date: Date.now,
        image: "image2.png",
        title: "Birthday Celebration",
        content: "We celebrated my friend's birthday at a nice restaurant. It was a great evening with lots of fun and laughter.",
        isBookmarked: false,
        tags: ["birthday", "friends", "celebration"]
    ))
}
