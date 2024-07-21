//
//  DiarySheetViewModel.swift
//  bottari
//
//  Created by 송지혁 on 7/22/24.
//

import Combine

class DiarySheetViewModel: ObservableObject {
    private let createThreadUseCase: CreateThreadUseCase
    private let createMessageUseCase: CreateMessageUseCase
    private let createRunUseCase: CreateRunUseCase
    private let listRunStepUseCase: ListRunStepUseCase
    private let retrieveMessageUseCase: RetrieveMessageUseCase
    
    
    private var cancellables = Set<AnyCancellable>()
    
    init(createThreadUseCase: CreateThreadUseCase, createMessageUseCase: CreateMessageUseCase, createRunUseCase: CreateRunUseCase, listRunStepUseCase: ListRunStepUseCase, retrieveMessageUseCase: RetrieveMessageUseCase) {
        self.createThreadUseCase = createThreadUseCase
        self.createMessageUseCase = createMessageUseCase
        self.createRunUseCase = createRunUseCase
        self.listRunStepUseCase = listRunStepUseCase
        self.retrieveMessageUseCase = retrieveMessageUseCase
    }
    
    @Published var apiResponse: ThreadResponse?
    @Published var messageResponse: CreateMessageResponse?
    @Published var runResponse: RunResponse?
    @Published var runStepResponse: RunStepResponse?
    @Published var retrieveMessageResponse: RetrieveMessageResponse?
    
    
    @Published var errorMessage: String?
    
    func createThread(messages: [String]) {
        createThreadUseCase.execute(messages: messages)
            .sink(receiveCompletion: { completion in
                switch completion {
                    case .finished:
                        break
                    case .failure(let error):
                        self.errorMessage = error.localizedDescription
                }
            }, receiveValue: { apiResponse in
                self.apiResponse = apiResponse
            })
            .store(in: &cancellables)
    }
            
    func createMessage(threadID: String, message: String) {
        createMessageUseCase.execute(threadID: threadID, message: message)
            .sink { completion in
                switch completion {
                    case .finished:
                        break
                    case .failure(let error):
                        self.errorMessage = error.localizedDescription
                }
            } receiveValue: { messageResponse in
                self.messageResponse = messageResponse
            }
            .store(in: &cancellables)
    }
        
    func createRun(threadID: String, assistantID: String) {
        createRunUseCase.execute(threadID: threadID, assistantID: assistantID)
            .sink { completion in
                switch completion {
                    case .finished:
                        break
                    case .failure(let error):
                        self.errorMessage = error.localizedDescription
                }
            } receiveValue: { runResponse in
                self.runResponse = runResponse
            }
            .store(in: &cancellables)
    }
    
    func listRunStep(threadID: String, runID: String) {
        listRunStepUseCase.execute(threadID: threadID, runID: runID)
            .sink { completion in
                switch completion {
                    case .finished:
                        break
                    case .failure(let error):
                        self.errorMessage = error.localizedDescription
                }
            } receiveValue: { runStepResponse in
                self.runStepResponse = runStepResponse
            }
            .store(in: &cancellables)
    }
    
    func retrieveMessage(threadID: String, messageID: String) {
        retrieveMessageUseCase.execute(threadID: threadID, messageID: messageID)
            .sink { completion in
                switch completion {
                    case .finished:
                        break
                    case .failure(let error):
                        self.errorMessage = error.localizedDescription
                }
            } receiveValue: { retrieveMessageResponse in
                self.retrieveMessageResponse = retrieveMessageResponse
            }
            .store(in: &cancellables)

    }
}
