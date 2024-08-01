//
//  MemoryEntity.swift
//  bottari
//
//  Created by 장수민 on 8/1/24.
//

import Combine
import Foundation
import SwiftData

@Model
class MemoryEntity {
    @Attribute(.unique)let id: UUID
    var date: Date
    var image: String?
    var title: String
    var content: String
    var isBookmarked: Bool
    var tags: [String]
    // MARK: 퀴즈도 모델로 해야 저장이 되네요 일단 보류 ㅎㅎ...
    
    init(id: UUID, date: Date, image: String?, title: String, content: String, isBookmarked: Bool, tags: [String]) {
        self.id = id
        self.date = date // 어떻게 할까요우
        self.image = image
        self.title = title
        self.content = content
        self.isBookmarked = isBookmarked
        self.tags = tags
    }
}

