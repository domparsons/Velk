//
//  DetailView.swift
//  Velk
//
//  Created by Dom Parsons on 27/08/2023.
//


import SwiftUI
import CodeEditor

struct DetailView: View {

    @Environment(\.colorScheme) var colorScheme
    
    #if os(macOS)
        @AppStorage("fontsize") var fontSize = Int(NSFont.systemFontSize+5)
    #endif
    
    @EnvironmentObject var viewModel: ViewModel
    
    var folders: FetchedResults<Folder>
    let notes: [Note]
    
    var body: some View {
        GeometryReader { geo in
            VStack {
                if notes.count > 0 && viewModel.selectedNote != nil {
                    HStack {
                        VStack(alignment: .leading) {
                            HStack {
                                VStack(alignment: .leading, spacing: 10) {
                                    Text(viewModel.selectedNote!.wrappedName)
                                        .font(.title)
                                    Text(viewModel.selectedNote!.wrappedCodeDescription)
                                        .foregroundColor(.secondary)
                                }
                                
                                Spacer()
                                
                                HStack(spacing: 20) {
                                    Picker("Select Language", selection: $viewModel.selectedLanguage) {
                                        ForEach(CodeEditor.availableLanguages, id: \.self) { language in
                                            Text(language.rawValue.capitalized)
                                                .tag(language)
                                        }
                                    }
                                    .frame(width: 200)
                                    .onChange(of: viewModel.selectedLanguage) { newLanguage in
                                        viewModel.updateCoreDataLanguage()
                                    }
                                    
                                    Button {
                                        viewModel.showingUpdateNoteView = true
                                    } label: {
                                        Image(systemName: "pencil")
                                            .font(.title2)
                                    }
                                    .buttonStyle(.plain)
                                    
                                    Button {
                                        viewModel.copyCode()
                                    } label: {
                                        Image(systemName: "doc.on.doc")
                                            .font(.title2)
                                    }
                                    .buttonStyle(.plain)
                                }
                            }

                            CodeEditor(source: $viewModel.tempCodeString,
                                       language: viewModel.selectedLanguage,
                                       theme: viewModel.selectedTheme,
                                       fontSize: .init(get: { CGFloat(fontSize) }, set: { fontSize = Int($0) }))
                                .frame(minWidth: 640, minHeight: 480)
                                .cornerRadius(8)
                                .onChange(of: viewModel.tempCodeString, perform: { newText in
                                    viewModel.updateCode()
                                })
                        }
                        .padding()
                    }
                    Spacer()

                } else {
                    Spacer()
                    
                    HStack {
                        Spacer()
                        Text("No note selected")
                            .font(.title)
                            .foregroundColor(.secondary)
                        Spacer()
                    }
                    
                    Spacer()
                }
            }
        }
        .toolbar {
            ToolbarItem {
                Button {
                    viewModel.showingNewNoteFromClipboardSheet = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            
            ToolbarItem {
                Spacer()
            }
            
            ToolbarItem() {
                Button {
                    viewModel.showingDeletionConfirmation = true
                } label: {
                    Image(systemName: "trash")
                }
                .disabled(viewModel.selectedNote == nil)
            }
        }
        .sheet(isPresented: $viewModel.showingNewNoteSheet) {
            AddNewNoteView(folders: folders)
        }
        .sheet(isPresented: $viewModel.showingNewNoteFromClipboardSheet) {
            AddNewNoteFromClipboardView(folders: folders)
        }
        .sheet(isPresented: $viewModel.showingUpdateNoteView) {
            UpdateNoteView(folders: folders)
        }
        .alert("Delete note", isPresented: $viewModel.showingDeletionConfirmation) {
            Button("Cancel", role: .cancel) {}
            
            Button("Delete", role: .destructive) {
                viewModel.deleteNote()
                selectNewNote()
            }
        } message: {
            Text("Are you sure you want to delete this note?")
        }
        .onChange(of: viewModel.selectedNote) { newNote in
            viewModel.updateCurrentLanguage()
        }
        .onAppear() {
            viewModel.printThemes()
        }
    }
    
    func selectNewNote() {
        viewModel.selectedNote = notes[0]
        viewModel.tempCodeString = notes[0].codeBlock ?? "Unknown"
    }
}

//struct DetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        DetailView()
//    }
//}
