//
//  FocusableTextEditor.swift
//  bottari
//
//  Created by 장수민 on 8/1/24.
//

import SwiftUI

//struct FocusableTextEditor: UIViewRepresentable {
//    @Binding var text: String
//    var isFirstResponder: Bool
//
//    func makeUIView(context: Context) -> UITextView {
//        let textView = UITextView()
//        textView.delegate = context.coordinator
//        textView.isSelectable = true
//        textView.isEditable = true
//        textView.isUserInteractionEnabled = true
//        textView.backgroundColor = UIColor.white
//        textView.layer.cornerRadius = 10
//        textView.layer.shadowColor = UIColor.clear.cgColor  // 그림자 제거
//        textView.layer.shadowOpacity = 0
//        textView.layer.shadowOffset = CGSize.zero
//        textView.layer.shadowRadius = 0
//        textView.font = UIFont.systemFont(ofSize: 16)  // 원하는 폰트 크기로 변경
//        textView.textContainerInset = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8) // 내부 패딩 조정
//        if isFirstResponder {
//            textView.becomeFirstResponder()
//        }
//        return textView
//    }
//
//    func updateUIView(_ uiView: UITextView, context: Context) {
//        uiView.text = text
//        if isFirstResponder {
//            uiView.becomeFirstResponder()
//        }
//    }
//
//    func makeCoordinator() -> Coordinator {
//        Coordinator(self)
//    }
//
//    class Coordinator: NSObject, UITextViewDelegate {
//        var parent: FocusableTextEditor
//
//        init(_ parent: FocusableTextEditor) {
//            self.parent = parent
//        }
//
//        func textViewDidChange(_ textView: UITextView) {
//            parent.text = textView.text
//        }
//    }
//}
