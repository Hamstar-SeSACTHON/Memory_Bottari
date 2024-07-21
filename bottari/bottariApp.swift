//
//  bottariApp.swift
//  bottari
//
//  Created by 송지혁 on 7/21/24.
//

import SwiftUI

@main
struct bottariApp: App {
    @StateObject private var container = DIContainer.shared
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(container)
        }
    }
}
