//
//  QuizEntity.swift
//  bottari
//
//  Created by 송지혁 on 8/1/24.
//

import Foundation
import SwiftData

@Model
class QuizEntity {
    @Attribute(.unique) let id: UUID
    let date: Date
    let question: String
    let options: [String]
    var correctOption: String
    var successMessage: String
    @Relationship(deleteRule: .cascade, inverse: \MemoryEntity.quizzes) var memory: MemoryEntity?
    
    init(id: UUID = UUID(), date: Date = Date(), question: String, options: [String], correctOption: String, successMessage: String) {
        self.id = id
        self.date = date
        self.question = question
        self.options = options
        self.correctOption = correctOption
        self.successMessage = successMessage
    }
}
