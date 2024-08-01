//
//  DiarySheetViewModel.swift
//  bottari
//
//  Created by 송지혁 on 7/22/24.
//

import Combine
import Foundation

class DiarySheetViewModel: ObservableObject {
    private let assistantInteractionFacade: AssistantInteractionFacadeImpl
    
    @Published var apiResponse: ThreadResponse?
    @Published var messageResponse: CreateMessageResponse?
    @Published var runResponse: RunResponse?
    @Published var runStepResponse: RunStepResponse?
    @Published var retrieveMessageResponse: RetrieveMessageResponse?
    @Published var errorMessage: String?
    @Published var receivedMessage: String?
    
    private var cancellables = Set<AnyCancellable>()
    
    init(assistantInteractionFacade: AssistantInteractionFacadeImpl) {
        self.assistantInteractionFacade = assistantInteractionFacade
        
        $receivedMessage
            .sink { completion in
                
            } receiveValue: { message in
                print(message)
                self.decodingToQuiz(json: message ?? "")
            }
            .store(in: &cancellables)
        
    }
    
    func sendMessage(_ message: String) {
        assistantInteractionFacade.interact(with: message)
            .sink(receiveCompletion: { completion in
                if case .failure(let error) = completion {
                    self.errorMessage = error.localizedDescription
                }
            }, receiveValue: { response in
                self.receivedMessage = response
            })
            .store(in: &cancellables)
    }
    
    func decodingToQuiz(json: String) -> Quiz? {
        guard let jsonData = json.data(using: .utf8) else { return nil }
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        
        do {
            let quiz = try decoder.decode(Quiz.self, from: jsonData)
            print(quiz)
            return quiz
        } catch {
            print(error)
            return nil
        }
    }
}
