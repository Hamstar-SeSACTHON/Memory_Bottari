//
//  MemoryDatabase.swift
//  bottari
//
//  Created by 장수민 on 8/1/24.
//

import Foundation
import SwiftData

final class MemoryDatabase {
    static let shared = MemoryDatabase()
    
    var container: ModelContainer
    let context: ModelContext
    
    init() {
        container =  {
            let schema = Schema([MemoryEntity.self])
            do {
                let container = try ModelContainer(for: schema, configurations: [])
                return container
            } catch {
                fatalError("Cannot Load Swift Data")
            }
        }()
        
        context = ModelContext(container)
    }
    
        func deleteDatabase() throws {
            container.deleteAllData()
            container = {
                let schema = Schema([MemoryEntity.self])
                do {
                    let container = try ModelContainer(for: schema, configurations: [])
                    return container
                } catch {
                    fatalError("Cannot Load Swift Data")
                }
            }()
        }
}
