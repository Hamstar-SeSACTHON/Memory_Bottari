//
//  bottariApp.swift
//  bottari
//
//  Created by 송지혁 on 7/21/24.
//

import SwiftUI
import SwiftData

@main
struct bottariApp: App {
    @StateObject private var container = DIContainer.shared
    @StateObject var appViewModel = AppViewModel.shared
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(container)
                .environmentObject(NavigationManager())
                .environmentObject(appViewModel)
        }
        .modelContainer(MemoryDatabase.shared.container)
    }
}
