//
//  Memory.swift
//  bottari
//
//  Created by 송지혁 on 7/21/24.
//

import Combine
import Foundation
import SwiftData

//struct Memory {
//    let date: Date
//    let image: String?
//    let title: String
//    let content: String
//    let isBookmarked: Bool
//}

@Model
class MemoryEntity {
  let id = UUID()
  let date: Date
  let image: String?
  let title: String
  let content: String
  let isBookmarked: Bool
  // MARK: 퀴즈도 모델로 해야 저장이 되네요 일단 보류 ㅎㅎ...
  
    init(date: Date, image: String?, title: String, content: String, isBookmarked: Bool) {
    self.date = date
    self.image = image
    self.title = title
    self.content = content
    self.isBookmarked = isBookmarked
  }
}

