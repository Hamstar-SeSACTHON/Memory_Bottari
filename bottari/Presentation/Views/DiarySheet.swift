//
//  DiarySheet.swift
//  bottari
//
//  Created by 송지혁 on 7/22/24.
//

import SwiftUI

struct DiarySheet: View {
    @State private var content = ""
    @ObservedObject var viewModel: DiarySheetViewModel
    
    var assistantID: String {
        guard let assistantID = Bundle.main.object(forInfoDictionaryKey: "ASSISTANT_ID") as? String else { return "" }
        return assistantID
    }
    
    init(viewModel: DiarySheetViewModel) {
        self._viewModel = ObservedObject(initialValue: viewModel)
    }
    
    var body: some View {
        TextField("일기를 입력해주세요", text: $content)
        
        Button("스레드 완료") {
            viewModel.createThread(messages: [content])
        }
        
        Button("메시지 완료") {
            viewModel.createMessage(threadID: viewModel.apiResponse?.id ?? "0", message: """
                                    2023.08.01
                                    
                                    로렌조와 나는 팀이 되어 해커톤에 나갔다.
                                    미리 잘 준비해서 3일만에 다 만들고 대상을 받았다.
                                    하지만 아뿔싸 로렌조가 상금을 몽땅 차지하여 달아나버렸다.
                                    """)
        }
        
        Button("런 완료") {
            viewModel.createRun(threadID: viewModel.apiResponse?.id ?? "0", assistantID: assistantID)
        }
        
        Button("런스텝 완료") {
            viewModel.listRunStep(threadID: viewModel.apiResponse?.id ?? "0", runID: viewModel.runResponse?.id ?? "0")
        }
        
        Button("메세지 검색 완료") {
            viewModel.retrieveMessage(threadID: viewModel.apiResponse?.id ?? "0", messageID: viewModel.runStepResponse?.data.first?.stepDetails.messageCreation?.messageId ?? "0")
        }
        
        Text(viewModel.apiResponse?.id ?? "스레드 nil")
        Text(viewModel.messageResponse?.id ?? "메시지 nil")
        Text(viewModel.runResponse?.id ?? "런 nil")
        Text(viewModel.runStepResponse?.data.first?.stepDetails.messageCreation?.messageId ?? "런 스텝 nil")
        Text(viewModel.retrieveMessageResponse?.content.first?.text.value ?? "메세지 검색 nil")
        
        
        Text(viewModel.errorMessage ?? "에러 메시지")
    }
}
