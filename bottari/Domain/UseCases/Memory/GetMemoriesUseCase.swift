//
//  GetMemoriesUseCase.swift
//  bottari
//
//  Created by 장수민 on 8/1/24.
//

import Foundation
import SwiftData

final class GetMemoriesUseCase {
    static let shared = GetMemoriesUseCase()
    
    let memoryRepository: MemoryRepository
    
    init(memoryRepository: MemoryRepository = MemoryRepositoryImpl.shared) {
        self.memoryRepository = memoryRepository
    }
    
    func excute() async throws -> [Memory] {
        return try await memoryRepository.getMemories()
    }
}
