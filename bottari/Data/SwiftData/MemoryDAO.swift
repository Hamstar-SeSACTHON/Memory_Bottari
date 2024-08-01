//
//  MemoryDAO.swift
//  bottari
//
//  Created by 장수민 on 8/1/24.
//

import Foundation
import SwiftData

final class MemoryDAO {
    static let shared = MemoryDAO()
    var memoryDatabase = MemoryDatabase()
    
    init(memoryDatabase: MemoryDatabase = MemoryDatabase.shared) {
        self.memoryDatabase = memoryDatabase
    }
    
    func getSavedMemories() throws -> [Memory] {
        let fetchDescriptor = FetchDescriptor<MemoryEntity>()
        let memoriEntities = try memoryDatabase.context.fetch(fetchDescriptor)
        let memories = memoriEntities.map { memoryEntity in
            return Memory(id: memoryEntity.id ,date: memoryEntity.date, image: memoryEntity.image, title: memoryEntity.title, content: memoryEntity.content, isBookmarked: memoryEntity.isBookmarked, tags: memoryEntity.tags)
        }
        return memories
    }
    
    func insert(memory: Memory) {
        let memoryEntity = MemoryEntity(id: memory.id, date: memory.date, image: memory.image, title: memory.title, content: memory.content, isBookmarked: memory.isBookmarked, tags: memory.tags
        )
        memoryDatabase.context.insert(memoryEntity)
        Task {
            try memoryDatabase.context.save()
        }
    }
    
    func delete(memory: Memory) throws {
        let titleToDelete = memory.title
        let fetchDescriptor = FetchDescriptor<MemoryEntity>(
            predicate: #Predicate { entity in
                entity.title == titleToDelete
            }
        )
        
        if let memoryEntity = try memoryDatabase.context.fetch(fetchDescriptor).first {
            memoryDatabase.context.delete(memoryEntity)
            try memoryDatabase.context.save()
        } else {
            print("cannot delete")
        }
    }
    
    func update(memory: Memory) throws {
        let memoryEntity = MemoryEntity(id: memory.id,
                                        date: memory.date,
                                        image: memory.image,
                                        title: memory.title,
                                        content: memory.content,
                                        isBookmarked: memory.isBookmarked
        )
        memoryDatabase.context.insert(memoryEntity)
        do {try memoryDatabase.context.save()
            print("dssdsd")
        } catch {print("asd")}
        
    }
}
