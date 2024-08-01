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
    
//    func getSavedMemories() throws -> [Memory] {
//        let fetchDescriptor = FetchDescriptor<MemoryEntity>()
//        let memoriEntities = try memoryDatabase.context.fetch(fetchDescriptor)
//        let memories = memoriEntities.map { memoryEntity in
//            return Memory(id: memoryEntity.id ,date: memoryEntity.date, image: memoryEntity.image, title: memoryEntity.title, content: memoryEntity.content, tags: memoryEntity.tags)
//        }
//        return memories
//    }
    
    func getSavedMemories() throws -> [Memory] {
        let fetchDescriptor = FetchDescriptor<MemoryEntity>()
        let memoryEntities = try memoryDatabase.context.fetch(fetchDescriptor)
        let memories = memoryEntities.map { memoryEntity in
            let quizzes = memoryEntity.quizzes.map { quizEntity in
                Quiz(
                    id: quizEntity.id,
                    date: quizEntity.date,
                    question: quizEntity.question,
                    options: quizEntity.options,
                    correctOption: quizEntity.correctOption,
                    successMessage: quizEntity.successMessage
                )
            }
            return Memory(
                id: memoryEntity.id,
                date: memoryEntity.date,
                image: memoryEntity.image,
                title: memoryEntity.title,
                content: memoryEntity.content,
                tags: memoryEntity.tags,
                quizzes: quizzes
            )
        }
        return memories
    }
    
    func insert(memory: Memory) {
        let memoryEntity = MemoryEntity(
            id: memory.id,
            date: memory.date,
            image: memory.image,
            title: memory.title,
            content: memory.content,
            tags: memory.tags
        )
        
        for quiz in memory.quizzes {
            let quizEntity = QuizEntity(
                id: quiz.id,
                date: quiz.date,
                question: quiz.question,
                options: quiz.options,
                correctOption: quiz.correctOption,
                successMessage: quiz.successMessage
//                memory: memoryEntity
            )
            memoryEntity.quizzes.append(quizEntity)
        }
        
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
        let memoryId = memory.id
        let fetchDescriptor = FetchDescriptor<MemoryEntity>(
            predicate: #Predicate { entity in
                entity.id == memoryId
            }
        )
        
        if let memoryEntity = try memoryDatabase.context.fetch(fetchDescriptor).first {
            memoryEntity.date = memory.date
            memoryEntity.image = memory.image
            memoryEntity.title = memory.title
            memoryEntity.content = memory.content
            memoryEntity.tags = memory.tags
            
            // Remove existing quizzes
            for quizEntity in memoryEntity.quizzes {
                memoryDatabase.context.delete(quizEntity)
            }
            memoryEntity.quizzes.removeAll()
            
            // Add updated quizzes
            for quiz in memory.quizzes {
                let quizEntity = QuizEntity(
                    id: quiz.id,
                    date: quiz.date,
                    question: quiz.question,
                    options: quiz.options,
                    correctOption: quiz.correctOption,
                    successMessage: quiz.successMessage
//                    memory: memoryEntity
                )
                memoryEntity.quizzes.append(quizEntity)
            }
            
            try memoryDatabase.context.save()
        }
    }
}
