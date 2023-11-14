//
//  UpdateNoteView.swift
//  Velk
//
//  Created by Dom Parsons on 17/10/2023.
//

import SwiftUI

struct UpdateNoteView: View {
    
    @EnvironmentObject var viewModel: ViewModel
    
    var folders: FetchedResults<Folder>
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Update Note")
                .font(.title)
                .fontWeight(.bold)
            
            TextField("Name", text: $viewModel.updatedTitle)
                .textFieldStyle(.roundedBorder)
            
            TextField("Description", text: $viewModel.updatedDescription)
                .textFieldStyle(.roundedBorder)
            
//            Picker("Folder", selection: $viewModel.updatedFolderDestinationIndex) {
//                ForEach(0..<folders.count, id: \.self) { index in
//                    Text(folders[index].folderName ?? "Unknown Folder")
//                }
//            }
//            .pickerStyle(MenuPickerStyle())
            
            HStack(spacing: 20) {
                Spacer()
                Button("Cancel", role: .cancel) {
                    viewModel.showingUpdateNoteView = false
                }
                .keyboardShortcut(.cancelAction)
                .cornerRadius(6)
                .buttonStyle(.bordered)
                
                Button("Update") {
                    viewModel.updateNote()
                    viewModel.showingUpdateNoteView = false
                }
                .keyboardShortcut(.defaultAction)
                .foregroundColor(.white)
                .cornerRadius(6)
            }
        }
        .onAppear {
            viewModel.updatedTitle = viewModel.selectedNote!.wrappedName
            viewModel.updatedDescription = viewModel.selectedNote!.wrappedCodeDescription
//            viewModel.updatedFolderDestinationIndex = viewModel.selectedNote?.folder
        }

        .padding()
        .frame(minWidth: 500)
    }
}

//#Preview {
//    UpdateNoteView()
//}
