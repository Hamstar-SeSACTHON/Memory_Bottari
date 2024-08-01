import SwiftUI
import SwiftData

@MainActor
struct JournalEntryView: View {
    @State private var message: String = ""
    @State private var isEditing: Bool = true
    @State private var isTapped: Bool = false
    @State private var showAlert: Bool = false
    @StateObject var imageViewModel = ImagePickerViewModel()
    
    var topic: String?
    
    @EnvironmentObject var appViewModel: AppViewModel
    @Environment(\.modelContext) var context
    @Environment(\.dismiss) var dismiss
    @ObservedObject private var keyboardResponder = KeyboardResponder()
    
    var body: some View {
        VStack(spacing: 0) {
            ScrollView {
                VStack {
                    ZStack(alignment: .center) {
                        Text("새 기억 작성하기")
                            .font(.pretendBold16)
                            .foregroundStyle(Color.gray500)
                        HStack {
                            Image(systemName: "xmark")
                                .font(.title)
                                .foregroundColor(Color.black)
                                .onTapGesture {
                                    if !message.isEmpty {
                                        showAlert = true
                                        hideKeyboard()
                                    } else {
                                        hideKeyboard()
                                        dismiss()
                                    }
                                }
                            Spacer()
                            
                            Button("완료") {
                                isEditing = false
                                hideKeyboard()
                            }
                            .buttonStyle(JournalButtonStyle(isEnabled: !message.isEmpty))
                            .disabled(message.isEmpty)
                        }
                    }
                    .padding(.bottom, 40)
                    
                    if let topic = topic {
                        topicBubbleView(topic: topic)
                            .padding(.bottom, 20)
                    }
                    
                    DynamicHeightTextEditor(text: $message, isEditing: $isEditing)
                        .padding()
                        .background(Color.white)
                        .cornerRadius(24)
                        .padding(.bottom, 20)
                    
                    if let selectedImage = imageViewModel.selectedImage {
                        ZStack(alignment: .topTrailing) {
                            Image(uiImage: selectedImage)
                                .resizable()
                                .scaledToFit()
                                .frame(maxWidth: .infinity)
                                .cornerRadius(24)
                            
                            Button(action: {
                                imageViewModel.selectedImage = nil
                                hideKeyboard()
                            }) {
                                Image(systemName: "xmark")
                                    .foregroundStyle(Color.gray600)
                                    .padding(10)
                                    .background(Circle().fill(.gray100))
                            }
                            .padding(20)
                            
                        }
                    }
                }
                .padding(.top, 8)
                .padding(.horizontal, 24)
                .navigationBarBackButtonHidden()
                .onTapGesture {
                    hideKeyboard()
                    isEditing = false
                }
            }
            
            Spacer()
            
            bottomBar
                .background(Color.gray200.ignoresSafeArea())
                .animation(.easeOut(duration: keyboardResponder.animationDuration), value: keyboardResponder.currentHeight)
            
        }
        .alert(title: "정말 나가시겠습니까?", primaryButton:CustomAlertButton(title: "계속 작성하기", action: {
            
            showAlert.toggle()
        }) , secondaryButton: CustomAlertButton(title: "작성 그만하기", action: {
            hideKeyboard()
            dismiss()
        }), isPresented: $showAlert)
        .sheet(isPresented: $isTapped) {
            ImagePicker(isPresented: $isTapped, viewModel: imageViewModel)
        }
        .background(
            Color.gray200
                .ignoresSafeArea()
        )
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                self.isEditing = true
            }
        }
    }
    
    private var bottomBar: some View {
        HStack {
            Button(action: {
                isTapped.toggle()
            }) {
                Image(systemName: "photo.on.rectangle")
                    .font(.title)
                    .padding()
                    .foregroundStyle(Color.gray600)
            }
            Spacer()
        }
    }
    
    private func topicBubbleView(topic: String) -> some View {
        let sentence = "\"\(topic)\""
        
        return ZStack(alignment: .center) {
            Image("JournalBubble")
                .resizable()
                .scaledToFit()
                .frame(maxWidth: .infinity)
            Text(sentence)
                .font(.pretendBold20)
                .foregroundStyle(Color.gray500)
                .padding(.bottom, 10)
        }
    }
    
    private func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

struct DynamicHeightTextEditor: View {
    @Binding var text: String
    @Binding var isEditing: Bool
    @State private var dynamicHeight: CGFloat = 200
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            TextEditor(text: $text)
                .frame(minHeight: isEditing ? 200 : max(dynamicHeight, 200), maxHeight: .infinity)
                .background(
                    GeometryReader { geometry in
                        Color.clear
                            .preference(key: ViewHeightKey.self, value: geometry.size.height)
                    }
                )
                .onPreferenceChange(ViewHeightKey.self) { height in
                    dynamicHeight = height
                }
                .onChange(of: isEditing) { _ in
                    dynamicHeight = isEditing ? max(dynamicHeight, 200) : max(dynamicHeight, 200)
                }
        }
    }
}

struct ViewHeightKey: PreferenceKey {
    static var defaultValue: CGFloat = 100
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}
