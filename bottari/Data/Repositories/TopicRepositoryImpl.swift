//
//  TopicRepositoryImpl.swift
//  bottari
//
//  Created by 장수민 on 8/1/24.
//

import Foundation

class TopicRepositoryImpl: TopicRepository {
    static let shared = TopicRepositoryImpl()
    
    func getAllTopics() -> [String] {
        return Topic.topics
    }
}
