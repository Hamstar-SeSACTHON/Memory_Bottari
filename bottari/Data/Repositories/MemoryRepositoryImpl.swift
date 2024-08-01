//
//  MemoryRepositoryImpl.swift
//  bottari
//
//  Created by 장수민 on 7/31/24.
//

import Foundation
import SwiftData

final class MemoryRepositoryImpl : MemoryRepository {
    static let shared = MemoryRepositoryImpl()
    
    let memorySwiftData: MemorySwiftData
    
    init(
        memorySwiftData: MemorySwiftData = MemorySwiftDataImpl.shared
    ) {
        self.memorySwiftData = memorySwiftData
    }
    
    func getMemories() throws -> [Memory] {
        return try memorySwiftData.getMemories()
    }
    
    func insertMemory(memory: Memory) {
        return memorySwiftData.insertMemory(memory: memory)
    }
    
    func deleteMemory(memory: Memory) throws {
        return try memorySwiftData.deleteMemory(memory: memory)
    }
    
    func updateMemory(memory: Memory) async throws {
        return try memorySwiftData.updateMemory(memory: memory)
    }
}
