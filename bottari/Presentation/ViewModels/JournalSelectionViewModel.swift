//
//  JournalSelectionViewModel.swift
//  bottari
//
//  Created by 장수민 on 8/1/24.
//

import Foundation

class JournalSelectionViewModel: ObservableObject {
    private let getAllTopicsUseCase = GetAllTopicsUseCase.shared
    @Published private(set) var topicList: [String]
    @Published var isTextEntered: Bool = false
    
    init() {
        self.topicList = []
        self.getAllTopics()
    }
    
    private func getAllTopics() {
        topicList = getAllTopicsUseCase.excute()
    }
    
    func getRandomTopics(count: Int) -> [String] {
        guard topicList.count >= count else { return topicList }
        return Array(topicList.shuffled().prefix(count))
    }
    
    
}
