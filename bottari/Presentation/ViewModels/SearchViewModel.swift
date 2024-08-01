//
//  SearchViewModel.swift
//  bottari
//
//  Created by 송지혁 on 8/1/24.
//

import Combine
import Foundation
import SwiftUI

class SearchViewModel: ObservableObject {
    @Published var memories: [Memory] = [
        
    ]
    
    @Published var filteredMemories: [Memory] = []
    @Published var recentSearchTerms: [String] = ["최근 검색1", "최근 검색2", "최근 검색3"]
    @Published var searchText = ""
    @Published var tags: Set<String> = ["손자와의 추억", "친구들과의 하루", "맛있는 음식", "1년 전 기억"]
    var appViewModel = AppViewModel.shared
    
    
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        loadRecentSearchTerm()
        
        
        appViewModel.$memoryList
            .assign(to: \.memories, on: self)
            .store(in: &cancellables)
        
        $searchText
            .debounce(for: .milliseconds(300), scheduler: RunLoop.main)
            .sink { [weak self] text in
                self?.filterMemories(with: text)
            }
            .store(in: &cancellables)
    }
    
    func addSearchTerm(_ term: String) {
        if let index = recentSearchTerms.firstIndex(of: term) {
            recentSearchTerms.remove(at: index)
        }
        
        recentSearchTerms.append(term)
        if recentSearchTerms.count > 3 {
            recentSearchTerms.removeFirst(recentSearchTerms.count - 3)
        }
        saveRecentSearchTerms()
    }
    
    private func loadRecentSearchTerm() {
        if let savedTerms = UserDefaults.standard.array(forKey: "recentSearchTerms") as? [String] {
            recentSearchTerms = savedTerms
        }
    }
    
    private func saveRecentSearchTerms() {
        UserDefaults.standard.set(recentSearchTerms, forKey: "recentSearchTerms")
    }
    
    private func filterMemories(with text: String) {
        if text.isEmpty {
            filteredMemories = memories
        } else {
            filteredMemories = memories.filter { memory in
                memory.content.contains(text) || memory.title.contains(text)
            }
        }
    }
    
    func findAllTags() {
        for memory in memories {
            for tag in memory.tags {
                tags.update(with: tag)
            }
        }
        
    }

    
}
