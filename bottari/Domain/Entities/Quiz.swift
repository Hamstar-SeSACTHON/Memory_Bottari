//
//  Quiz.swift
//  bottari
//
//  Created by 송지혁 on 7/21/24.
//

import Foundation

struct Quiz: Codable {
    let date: Date
    let question: String
    let options: [String]
    var correctOption: String
    var successMessage: String
}
