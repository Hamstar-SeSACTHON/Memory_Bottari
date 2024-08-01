//
//  MainView.swift
//  bottari
//
//  Created by 송지혁 on 7/21/24.
//

import SwiftUI

struct MainView: View {
    @State private var isFloatingButtonClicked = false
    @EnvironmentObject var container: DIContainer
    @EnvironmentObject var navigationManager: NavigationManager
    let quiz = Quiz(date: Date(), question: "어제 누구의 생일을 축하했나요?", options: ["친구", "큰 딸 민정이", "둘째 딸 민지"], correctOption: "큰 딸 민정이", successMessage: "어제 큰 딸의 생일을 축하했어요")
    
    var body: some View {
        NavigationStack(path: $navigationManager.screenPath) {
            ZStack {
                Color.gray200
                
                VStack {
                    QuizView(quiz: quiz)
                    Spacer()
                    floatingButton
                    
                }
            }
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
            .sheet(isPresented: $isFloatingButtonClicked) {
                if let createThreadUseCase = container.resolve(CreateThreadUseCase.self), let createMesssageUseCase = container.resolve(CreateMessageUseCase.self), let createRunUseCase = container.resolve(CreateRunUseCase.self), let listRunStepUseCase = container.resolve(ListRunStepUseCase.self), let retrieveMessageUseCase = container.resolve(RetrieveMessageUseCase.self)  {
                    DiarySheet(viewModel: DiarySheetViewModel(assistantInteractionFacade: AssistantInteractionFacadeImpl(createThreadUseCase: createThreadUseCase, createMessageUseCase: createMesssageUseCase, createRunUseCase: createRunUseCase, listRunStepUseCase: listRunStepUseCase, retrieveMessageUseCase: retrieveMessageUseCase)))
                }
            }
        }
    }
    
    private var floatingButton: some View {
        Image(systemName: "plus")
            .font(.system(size: 30))
            .foregroundStyle(.white)
            .padding()
            .background {
                Circle()
                    .fill(.blue)
            }
            .onTapGesture {
                isFloatingButtonClicked.toggle()
            }
    }
}

#Preview {
    MainView()
}
