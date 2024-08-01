//
//  TopicStyle.swift
//  bottari
//
//  Created by 장수민 on 8/1/24.
//

import SwiftUI

enum TopicStyle {
    case withTopic
    case withoutTopic

    var color: Color {
        switch self {
        case .withTopic:
            return Color.black
        case .withoutTopic:
            return Color.gray500
        }
    }
    
    var backgroundColor: Color {
        switch self {
        case .withTopic:
            return Color.gray100
        case .withoutTopic:
            return Color.gray300
        }
    }
}

