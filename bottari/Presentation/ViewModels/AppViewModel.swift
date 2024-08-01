//
//  JournalEntryViewModel.swift
//  bottari
//
//  Created by 장수민 on 8/1/24.
//

import Foundation
import SwiftUI
import Combine
import SwiftData

//@MainActor
final class AppViewModel: ObservableObject {
    static let shared = AppViewModel()
    
    @Published var memoryList: [Memory] = []
    
    private let getMemoriesUseCase = GetMemoriesUseCase.shared
    private let insertMemoryUseCase = InsertMemoryUseCase.shared
    private let deleteMemoryUseCase = DeleteMemoryUseCase.shared
    private let updateMemoryUseCase = UpdateMemoryUseCase.shared
    
    private init() {
        Task {
            try await getMemories()
        }
    }
    
    private func getMemories() async throws {
        do {
            memoryList = try await getMemoriesUseCase.excute()
        }
    }
    
    func insertMemory(memory: Memory) async throws {
        do {
            try await insertMemoryUseCase.execute(memory: memory)
            try await getMemories()
        }
    }
    
    func deleteMemory(memory: Memory) async throws {
        do {
            try await deleteMemoryUseCase.execute(memory: memory)
            try await getMemories()
        }
    }
    
    func updateMemory(memory: Memory) async throws {
        do {
            try await updateMemoryUseCase.execute(memory: memory)
            try await getMemories()
        }
    }
}
