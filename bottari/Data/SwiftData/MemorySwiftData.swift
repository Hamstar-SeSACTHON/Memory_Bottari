//
//  MemorySwiftData.swift
//  bottari
//
//  Created by 장수민 on 8/1/24.
//

import Foundation
protocol MemorySwiftData {
    func getMemories() throws -> [Memory]
    func insertMemory(memory: Memory)
    func deleteMemory(memory: Memory) throws
    func updateMemory(memory: Memory) throws
}
