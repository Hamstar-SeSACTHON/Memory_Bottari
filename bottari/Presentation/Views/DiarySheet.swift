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
    
    init(viewModel: DiarySheetViewModel) {
        self._viewModel = ObservedObject(initialValue: viewModel)
    }
    
    var body: some View {
        TextField("일기를 입력해주세요", text: $content)
        
        Button("전송") {
            viewModel.sendMessage(content)
        }
        
        
        
        Text(viewModel.receivedMessage ?? "메세지 검색 nil")
        Text(viewModel.errorMessage ?? "에러 메시지")
    }
}
