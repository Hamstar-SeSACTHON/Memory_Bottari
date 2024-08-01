//
//  Memory.swift
//  bottari
//
//  Created by 송지혁 on 7/21/24.
//

import Foundation
  
struct Memory: Hashable {
    let id: UUID
    var date: Date
    var image: String?
    var title: String
    var content: String
    var tags: [String]
    var quizzes: [Quiz]
}
