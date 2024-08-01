//
//  MemoryRepository.swift
//  bottari
//
//  Created by 장수민 on 7/31/24.
//

import Foundation
import SwiftData

protocol MemoryRepository {
    func getMemories() async throws -> [Memory]
    func insertMemory(memory: Memory) async throws
    func deleteMemory(memory: Memory) async throws
    func updateMemory(memory: Memory) async throws
}
