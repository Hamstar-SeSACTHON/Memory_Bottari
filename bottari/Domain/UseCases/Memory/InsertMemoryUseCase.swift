//
//  InsertMemoryUseCase.swift
//  bottari
//
//  Created by 장수민 on 8/1/24.
//

import Foundation
import SwiftData

final class InsertMemoryUseCase {
    static let shared = InsertMemoryUseCase()
    
    let memoryRepository: MemoryRepository
    
    init(memoryRepository: MemoryRepository = MemoryRepositoryImpl.shared) {
        self.memoryRepository = memoryRepository
    }
    
    func execute(memory: Memory) async throws {
        try await memoryRepository.insertMemory(memory: memory)
    }
}
