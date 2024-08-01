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
    @State private var selectedAnswer: String?
    @State private var showJudgement = false
    
    var body: some View {
        NavigationStack(path: $navigationManager.screenPath) {
            ZStack {
                Image("background")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: .infinity)
                
                VStack(spacing: 0) {
                    if let quiz2 = quiz {
                        QuizView(selectedAnswer: $selectedAnswer, showJudgement: $showJudgement, quiz: $quiz)
                    }
                    
                    HStack {
                        Spacer()
                        
                        if selectedAnswer == nil {
                            Image("ddari")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 103)
                                .offset(y: -25)
                        } else if quiz?.correctOption == selectedAnswer {
                            Image("ddari_smile")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 103)
                                .offset(y: -25)
                        } else {
                            Image("ddari_wink")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 103)
                                .offset(y: -25)
                        }
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
