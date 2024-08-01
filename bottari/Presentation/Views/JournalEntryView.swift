//
//  JournalEntryView.swift
//  bottari
//
//  Created by 장수민 on 8/1/24.
//

import SwiftUI
import SwiftData

@MainActor
struct JournalEntryView: View {
    @State private var content = ""
    @EnvironmentObject var appViewModel: AppViewModel
    @Environment(\.modelContext) var context

    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}
