//
//  MemorySwiftDataImpl.swift
//  bottari
//
//  Created by 장수민 on 7/31/24.
//

import Foundation
import SwiftUI
import SwiftData

final class MemorySwiftDataImpl : MemorySwiftData {
    static let shared = MemorySwiftDataImpl()
    
    let memoryDao: MemoryDAO
    
    init(memoryDao: MemoryDAO = MemoryDAO.shared) {
        self.memoryDao = memoryDao
    }
    
    func getMemories() throws -> [Memory] {
        return try memoryDao.getSavedMemories()
    }
    
    func deleteMemory(memory: Memory) throws {
        return try memoryDao.delete(memory: memory)
    }
    
    func insertMemory(memory: Memory) {
       return memoryDao.insert(memory: memory)
    }
    
    func updateMemory(memory: Memory) throws {
        return try memoryDao.update(memory: memory)
    }
}
