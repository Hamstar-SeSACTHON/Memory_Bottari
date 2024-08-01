//
//  Memorylist.swift
//  bottari
//
//  Created by 송지혁 on 8/1/24.
//

import SwiftUI

struct Memorylist: View {
    let memories: [Memory]
    
    var body: some View {
        VStack(spacing: 12) {
            ForEach(memories, id: \.self) { memory in
                MemoryCard(memory: memory)
            }
        }
    }
}
