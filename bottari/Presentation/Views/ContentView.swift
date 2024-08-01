//
//  ContentView.swift
//  bottari
//
//  Created by 송지혁 on 7/21/24.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var navigationManager: NavigationManager
    
    var body: some View {
        MainView()
    }
}

#Preview {
    ContentView()
}

