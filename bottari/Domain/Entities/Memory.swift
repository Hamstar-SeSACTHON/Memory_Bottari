//
//  Memory.swift
//  bottari
//
//  Created by 송지혁 on 7/21/24.
//

import Combine
import Foundation

struct Memory: Hashable {
    let date: Date
    let image: String?
    let title: String
    let content: String
    let isBookmarked: Bool
    var tags: [String]
}

