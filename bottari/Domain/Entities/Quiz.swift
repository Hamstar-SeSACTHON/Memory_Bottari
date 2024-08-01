//
//  Quiz.swift
//  bottari
//
//  Created by 송지혁 on 7/21/24.
//

import Foundation

struct Quiz: Codable, Hashable {
    let id: UUID
    let date: Date
    let question: String
    let options: [String]
    var correctOption: String
    var successMessage: String
}

struct RemoteQuiz: Codable, Hashable {
    let date: Date
    let question: String
    let options: [String]
    var correctOption: String
    var successMessage: String
}

extension RemoteQuiz {
    func convertToLocalQuiz() -> Quiz {
        Quiz(id: UUID(), date: self.date, question: self.question, options: self.options, correctOption: self.correctOption, successMessage: self.successMessage)
    }
}
