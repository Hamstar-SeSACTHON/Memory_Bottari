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
    @Attribute(.unique) let id: UUID
    var date: Date
    var image: String?
    var title: String
    var content: String
    var tags: [String]
    @Relationship(deleteRule: .cascade) var quizzes: [QuizEntity]
    
    init(id: UUID = UUID(), date: Date = Date(), image: String? = nil, title: String, content: String, tags: [String]) {
        self.id = id
        self.date = date
        self.image = image
        self.title = title
        self.content = content
        self.tags = tags
        self.quizzes = []
    }
}
