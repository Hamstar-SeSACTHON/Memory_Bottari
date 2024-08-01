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
    
    var body: some View {
        VStack {
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
        .sheet(isPresented: $isFloatingButtonClicked) {
//            if let createThreadUseCase = container.resolve(CreateThreadUseCase.self), let createMesssageUseCase = container.resolve(CreateMessageUseCase.self), let createRunUseCase = container.resolve(CreateRunUseCase.self), let listRunStepUseCase = container.resolve(ListRunStepUseCase.self), let retrieveMessageUseCase = container.resolve(RetrieveMessageUseCase.self)  {
//                DiarySheet(viewModel: DiarySheetViewModel(assistantInteractionFacade: AssistantInteractionFacadeImpl(createThreadUseCase: createThreadUseCase, createMessageUseCase: createMesssageUseCase, createRunUseCase: createRunUseCase, listRunStepUseCase: listRunStepUseCase, retrieveMessageUseCase: retrieveMessageUseCase)))
//            }
            JournalEntryView()
        }
    }
}

#Preview {
    MainView()
}
