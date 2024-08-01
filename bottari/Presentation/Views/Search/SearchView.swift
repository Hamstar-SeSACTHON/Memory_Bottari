//
//  SearchView.swift
//  bottari
//
//  Created by 송지혁 on 8/1/24.
//

import SwiftUI

struct SearchView: View {
    @StateObject var searchViewModel = SearchViewModel()
    @Environment(\.dismiss) var dismiss
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        ZStack {
            background
            
            VStack(alignment: .leading) {
                header
                textfield
                
                ScrollView {
                    if searchViewModel.searchText.isEmpty {
                        memoryCategoryGrids
                    } else if searchViewModel.filteredMemories.isEmpty {
                        Text("검색 결과가 없어요")
                            .font(.pretendBold18)
                            .foregroundStyle(.gray400)
                    } else {
                        memorylist
                    }
                }
                
                Spacer()
            }
            .padding(.horizontal, 24)
            .padding(.top, 50)
        }
        .navigationBarBackButtonHidden()
        .ignoresSafeArea()
    }
    
    private var background: some View {
        VStack(spacing: 0) {
            Rectangle()
                .fill(.gray300)
                .frame(height: 235)
            
            Rectangle()
                .fill(.gray100)
        }
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
    }
    
    private var textfield: some View {
        TextField("찾고 싶은 기억을 입력하세요", text: $searchViewModel.searchText)
            .font(.pretendMedium20)
            .frame(maxWidth: .infinity)
            .padding(.leading, 16)
            .padding(.vertical, 12)
            .background {
                RoundedRectangle(cornerRadius: 16)
                    .fill(.gray100)
            }
            .shadow(color: .black.opacity(0.1), radius: 5, y: 10)
            .padding(.bottom, 32)
    }
    
    private var recentSearchSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("최근 검색")
                .font(.pretendBold18)
                .foregroundStyle(.gray400)
            
            HStack(spacing: 8) {
                ForEach(searchViewModel.recentSearchTerms, id: \.self) { searchTerm in
                    Text(searchTerm)
                        .font(.pretendMedium16)
                        .foregroundStyle(.gray200)
                        .padding(.horizontal, 12)
                        .padding(.vertical, 4)
                        .background {
                            RoundedRectangle(cornerRadius: 12)
                                .fill(.gray600)
                        }
                }
            }
        }
    }
    
    private var memoryCategory: some View {
        VStack(alignment: .leading) {
            Text("추천 기억")
                .font(.pretendBold18)
                .foregroundStyle(.gray400)
            LazyVGrid(columns: columns, spacing: 14) {
                ForEach(Array(searchViewModel.tags), id: \.self) { tag in
                    NavigationLink {
                        CategorizedMemoriesView(memories: searchViewModel.memories.filter { $0.tags.contains(tag) })
                    } label: {
                        MemoryCategoryGrid(tag: tag)
                    }

                    
                }
            }
        }
    }
    
    private var memoryCategoryGrids: some View {
        VStack(alignment: .leading, spacing: 0) {
            recentSearchSection
                .padding(.bottom, 28)
            memoryCategory
        }
    }
    
    private var memorylist: some View {
        Memorylist(memories: searchViewModel.filteredMemories)
    }
}

#Preview {
    SearchView()
}
