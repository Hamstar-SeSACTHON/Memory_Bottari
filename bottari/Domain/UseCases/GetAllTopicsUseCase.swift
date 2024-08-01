//
//  GetAllTopicsRepositoryImpl.swift
//  bottari
//
//  Created by 장수민 on 8/1/24.
//

import Foundation

final class GetAllTopicsUseCase {
    static let shared = GetAllTopicsUseCase()
    
    let topicRepository: TopicRepository
    
    init(topicRepository: TopicRepository = TopicRepositoryImpl.shared) {
        self.topicRepository = topicRepository
    }
    
    func excute() -> [String] {
        return topicRepository.getAllTopics()
    }
}

