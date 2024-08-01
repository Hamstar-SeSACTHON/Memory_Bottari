//
//  MainView.swift
//  bottari
//
//  Created by 송지혁 on 7/21/24.
//

import SwiftUI

struct MainView: View {
    
    @EnvironmentObject var navigationManager: NavigationManager
    @EnvironmentObject var appViewModel: AppViewModel
    @State private var quiz: Quiz?
    
    var body: some View {
        NavigationStack(path: $navigationManager.screenPath) {
            ZStack {
                Color.gray200
                
                VStack {
                    if let quiz2 = quiz {
                        QuizView(quiz: quiz2)
                    }
                    Spacer()
                }
            }
            .onReceive(appViewModel.$memoryList, perform: { _ in
                print(appViewModel.memoryList)
                if !appViewModel.memoryList.isEmpty {
                    quiz = appViewModel.memoryList.randomElement()!.quizzes.randomElement()
                }
            })
            .navigationDestination(for: AppScreen.self) { appScreen in
                appScreen.destination
            }
            .navigationBarBackButtonHidden()
            .ignoresSafeArea()
            .sheet(isPresented: $navigationManager.showMemories) {
                MemoryView()
                    .presentationDetents([.medium, .large])
                    .interactiveDismissDisabled()
                    .presentationBackgroundInteraction(.enabled(upThrough: .medium))
                    .presentationCornerRadius(24)
                
                
            }
            
        }
    }
    
    
}

#Preview {
    MainView()
}
