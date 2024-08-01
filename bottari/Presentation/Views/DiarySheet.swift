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
    @State private var isPickerPresented = false
    @StateObject var imagePickerViewModel = ImagePickerViewModel()
    
    init(viewModel: DiarySheetViewModel) {
        self._viewModel = ObservedObject(initialValue: viewModel)
    }
    
    var body: some View {
        VStack {
            TextField("일기를 입력해주세요", text: $content)
            
            Button("전송") {
                viewModel.sendMessage(content)
            }
            
            if let uiImage = imagePickerViewModel.selectedImage {
                Image(uiImage: uiImage)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
            }
            
            Button("Image Picker Test") {
                isPickerPresented.toggle()
            }
            
            Text(viewModel.receivedMessage ?? "메세지 검색 nil")
            Text(viewModel.errorMessage ?? "에러 메시지")
        }
        .sheet(isPresented: $isPickerPresented) {
            ImagePicker(isPresented: $isPickerPresented, viewModel: imagePickerViewModel
            )
        }
    }
}
