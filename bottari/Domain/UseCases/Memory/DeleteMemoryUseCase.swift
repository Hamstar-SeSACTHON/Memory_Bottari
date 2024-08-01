//
//  DeleteMemoryUseCase.swift
//  bottari
//
//  Created by 장수민 on 8/1/24.
//

import Foundation
import SwiftData

final class DeleteMemoryUseCase {
    static let shared = DeleteMemoryUseCase()
    
    let memoryRepository: MemoryRepository
    
    init(memoryRepository: MemoryRepository = MemoryRepositoryImpl.shared) {
        self.memoryRepository = memoryRepository
    }
    
    func execute(memory: Memory) async throws {
        return try await memoryRepository.deleteMemory(memory: memory)
    }
}
