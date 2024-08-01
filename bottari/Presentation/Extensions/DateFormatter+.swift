//
//  DateFormatter.swift
//  bottari
//
//  Created by 장수민 on 8/2/24.
//

import Foundation

extension DateFormatter {
    static let koreanDateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "ko_KR")
        formatter.dateFormat = "yyyy년 M월 d일"
        return formatter
    }()
}
