//
//  SettingsView.swift
//  Velk
//
//  Created by Dom Parsons on 22/10/2023.
//

import SwiftUI
import CodeEditor

struct SettingsView: View {
    
    @EnvironmentObject var viewModel: ViewModel
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("Settings")
                    .font(.title)
                Spacer()
                Button {
                    viewModel.showingSettings = false
                } label: {
                    Image(systemName: "xmark.circle")
                }
                .buttonStyle(.plain)
                .font(.title)
            }
            
            Picker("Theme", selection: $viewModel.selectedTheme) {
                ForEach(CodeEditor.availableThemes, id: \.self) { language in
                    Text(language.rawValue.capitalized)
                        .tag(language)
                }
            }
        }
        .padding()
        .frame(minWidth: 300)
    }
}

//#Preview {
//    SettingsView()
//}
