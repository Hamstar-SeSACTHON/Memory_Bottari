import Combine
import Foundation
import UIKit

enum MessagePurpose: String {
    case quiz = "다음 일기 내용을 바탕으로 퀴즈들을 만들어줘."
    case title = "다음 일기 내용을 바탕으로 적합한 일기 제목을 생성해줘."
    case tags = "다음 일기 내용에 적합한 키워드를 최소 1개부터 최대 3개까지 중복되지 않게 골라줘."
}

class DiarySheetViewModel: ObservableObject {
    private let assistantInteractionFacade: AssistantInteractionFacadeImpl
    let appViewModel = AppViewModel.shared
    @Published var apiResponse: ThreadResponse?
    @Published var messageResponse: CreateMessageResponse?
    @Published var runResponse: RunResponse?
    @Published var runStepResponse: RunStepResponse?
    @Published var retrieveMessageResponse: RetrieveMessageResponse?
    @Published var errorMessage: String?
    @Published var receivedMessage: String?
    @Published var quizzes: [Quiz]? = []
    @Published var tags: [String] = []
    @Published var title: String = ""
    @Published var uiImageString: String?
    
    private var cancellables = Set<AnyCancellable>()
    
    init(assistantInteractionFacade: AssistantInteractionFacadeImpl) {
        self.assistantInteractionFacade = assistantInteractionFacade
    }
    
    func handleCompleteButtonClick(title: String?, content: String, image: UIImage?) {
        sendMessageForQuiz(content)
            .flatMap { [unowned self] _ in
                self.sendMessageForTags(content)
            }
            .flatMap { [unowned self] _ in
                title == nil ? self.sendMessageForTitle(content) : Just(()).setFailureType(to: Error.self).eraseToAnyPublisher()
            }
            .sink(receiveCompletion: { completion in
                if case .failure(let error) = completion {
                    self.errorMessage = error.localizedDescription
                    print(error)
                }
            }, receiveValue: { [unowned self] in
                if let image = image {
                    guard let base64String = image.toBase64() else { return }
                    self.uiImageString = base64String
                }
                
                guard let quizzes = self.quizzes else { return }
                let memory = Memory(id: UUID(), date: Date(), image: self.uiImageString, title: self.title, content: content, tags: self.tags, quizzes: quizzes)
                
                Task {
                    do {
                        try await self.appViewModel.insertMemory(memory: memory)
                    } catch {
                        print("Failed to insert memory: \(error)")
                    }
                }
            })
            .store(in: &cancellables)
    }
    
    private func sendMessageForQuiz(_ message: String) -> AnyPublisher<Void, Error> {
        let order = MessagePurpose.quiz.rawValue
        return Future { promise in
            self.assistantInteractionFacade.interact(with: order + message)
                .sink(receiveCompletion: { completion in
                    if case .failure(let error) = completion {
                        promise(.failure(error))
                    } else {
                        promise(.success(()))
                    }
                }, receiveValue: { response in
                    self.receivedMessage = response
                    guard let receiveQuizzies = self.decodingToQuiz(json: response) else { return }
                    self.quizzes = receiveQuizzies.map { $0.convertToLocalQuiz() }
                })
                .store(in: &self.cancellables)
        }.eraseToAnyPublisher()
    }
    
    private func sendMessageForTags(_ message: String) -> AnyPublisher<Void, Error> {
        let order = MessagePurpose.tags.rawValue
        return Future { promise in
            self.assistantInteractionFacade.interact(with: order + message)
                .sink(receiveCompletion: { completion in
                    if case .failure(let error) = completion {
                        promise(.failure(error))
                    } else {
                        promise(.success(()))
                    }
                }, receiveValue: { response in
                    self.receivedMessage = response
                    self.tags = self.decodingToTags(json: response)
                    print(self.tags)
                })
                .store(in: &self.cancellables)
        }.eraseToAnyPublisher()
    }
    
    private func sendMessageForTitle(_ message: String) -> AnyPublisher<Void, Error> {
        let order = MessagePurpose.title.rawValue
        return Future { promise in
            self.assistantInteractionFacade.interact(with: order + message)
                .sink(receiveCompletion: { completion in
                    if case .failure(let error) = completion {
                        promise(.failure(error))
                    } else {
                        promise(.success(()))
                    }
                }, receiveValue: { response in
                    self.title = response
                })
                .store(in: &self.cancellables)
        }.eraseToAnyPublisher()
    }
    
    private func decodingToQuiz(json: String) -> [RemoteQuiz]? {
        guard let jsonData = json.data(using: .utf8) else { return nil }
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        
        do {
            let quiz = try decoder.decode([RemoteQuiz].self, from: jsonData)
            print(quiz)
            return quiz
        } catch {
            print(error)
            return nil
        }
    }
    
    private func decodingToTags(json: String) -> [String] {
        guard let jsonData = json.data(using: .utf8) else { return [] }
        let decoder = JSONDecoder()
        
        do {
            let response = try decoder.decode(TagResponse.self, from: jsonData)
            return response.tags
        } catch {
            print(error)
            return []
        }
    }
    
    private func decodingToTitle(json: String) -> String {
        guard let jsonData = json.data(using: .utf8) else { return "" }
        let decoder = JSONDecoder()
        
        do {
            let response = try decoder.decode(TitleResponse.self, from: jsonData)
            return response.title
        } catch {
            print(error)
            return ""
        }
    }
}

