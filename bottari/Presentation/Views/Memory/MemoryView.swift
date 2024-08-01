//
//  MemoryView.swift
//  bottari
//
//  Created by 송지혁 on 7/21/24.
//

import SwiftUI

struct MemoryView: View {
    @State private var isFloatingButtonClicked = false
    @EnvironmentObject var container: DIContainer
    @EnvironmentObject var navigationManager: NavigationManager
    @EnvironmentObject var appViewModel: AppViewModel
    
    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                header
                    .padding(.top, 28)
                memorylist
                
                Spacer()
                
                floatingButton
                
            }
            .padding(.horizontal, 24)
            .sheet(isPresented: $isFloatingButtonClicked) {
                if let createThreadUseCase = container.resolve(CreateThreadUseCase.self), let createMesssageUseCase = container.resolve(CreateMessageUseCase.self), let createRunUseCase = container.resolve(CreateRunUseCase.self), let listRunStepUseCase = container.resolve(ListRunStepUseCase.self), let retrieveMessageUseCase = container.resolve(RetrieveMessageUseCase.self)  {
                    DiarySheet(viewModel: DiarySheetViewModel(assistantInteractionFacade: AssistantInteractionFacadeImpl(createThreadUseCase: createThreadUseCase, createMessageUseCase: createMesssageUseCase, createRunUseCase: createRunUseCase, listRunStepUseCase: listRunStepUseCase, retrieveMessageUseCase: retrieveMessageUseCase)))
                }
            }
        }
    }
    
    private var header: some View {
        HStack {
            Text("기억 기록")
                .font(.pretendBold24)
                .foregroundStyle(.gray600)
            Spacer()
            Image(systemName: "magnifyingglass")
                .font(.system(size: 24, weight: .semibold))
                .foregroundStyle(.gray600)
                .onTapGesture {
                    navigationManager.screenPath.append(.search)
                }
        }
    }
    private var memorylist: some View {
        VStack(spacing: 12) {
            ForEach(appViewModel.memoryList, id: \.self) { memory in
                MemoryCard(memory: memory)
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
    MemoryView()
}

