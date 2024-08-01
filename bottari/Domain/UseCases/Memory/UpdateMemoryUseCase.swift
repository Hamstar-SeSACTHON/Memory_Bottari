//
//  UpdateMemoryUseCase.swift
//  bottari
//
//  Created by 장수민 on 8/1/24.
//

import Foundation
import SwiftData

final class UpdateMemoryUseCase {
    static let shared = UpdateMemoryUseCase()
    
    let memoryRepository: MemoryRepository
    
    init(memoryRepository: MemoryRepository = MemoryRepositoryImpl.shared) {
        self.memoryRepository = memoryRepository
    }
    
    func execute(memory: Memory) async throws {
        try await memoryRepository.updateMemory(memory: memory)
    }
}
