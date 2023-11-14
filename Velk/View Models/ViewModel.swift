//
//  ViewModel.swift
//  Velk
//
//  Created by Dom Parsons on 21/08/2023.
//

import Foundation
import Cocoa
import CodeEditor

enum SelectedArea {
    case sidebarView
    case notesListView
    case detailView
}

class ViewModel: ObservableObject {
    
    // The managed object context used to interact with Core Data.
    let moc: NSManagedObjectContext
    
    // Initializes the ViewModel with a managed object context.
    init(moc: NSManagedObjectContext) {
        self.moc = moc
//        if let themeRawValue = UserDefaults.standard.string(forKey: "selectedTheme"),
//           let theme = Theme(rawValue: themeRawValue) {
//            selectedTheme = theme
//        } else {
//            selectedTheme = .Ocean
//        }
    }
    
    // The current selected note (optional incase there are no notes)
    @Published var selectedNote: Note?
    @Published var selectedFolder: Folder?
    
    @Published var selectedArea: SelectedArea = .sidebarView
    
    // Properties for adding a new Folder
    @Published var newFolderName: String = ""
    @Published var showingNewFolderSheet = false
    
    // Properties for the code editor
    @Published var selectedLanguage: CodeEditor.Language = .swift
    @Published var selectedTheme: CodeEditor.ThemeName = .ocean
    
//    @Published var selectedTheme = CodeEditor.ThemeName(rawValue: Theme.RawValue))


    
    // Properties for adding a new Note
    @Published var newItemTitle: String = ""
    @Published var newItemDescription: String = ""
    @Published var newItemCode: String = ""
    @Published var newLanguage: CodeEditor.Language = .swift
    @Published var showingNewNoteSheet = false
    @Published var showingNewNoteFromClipboardSheet = false
    
    // Properties for updateing a Note's title and description
    @Published var updatedTitle: String = ""
    @Published var updatedDescription: String = ""
    @Published var updatedFolderDestinationIndex = 0
    @Published var showingUpdateNoteView = false
    
    // A temporary string property for editing code
    @Published var tempCodeString: String = "Unknown"
    
    // Holds the selected folder index to add the note to the correct folder
    @Published var folderDestinationIndex = 0
    
    // Max width of the text editor without wrapping text. Calculated with the tempCodeString.
    @Published var textEditorMaxWidth: CGFloat = 100
    
    // Error handling properties
    @Published var showingErrorAlert = false
    @Published var errorMessage = ""
    
    // Deletion confirmation alert
    @Published var showingDeletionConfirmation = false
    
    //Properties for settings sheet
    @Published var showingSettings = false
    
    // Function to update the temporary code string (the displayed code) when a Note is selected.
    func updateTempCodeString() {
        tempCodeString = selectedNote!.wrappedCodeBlock
    }
    
    // Function to copy the code to the clipboard (pasteboard)
    func copyCode() {
        let pasteboard = NSPasteboard.general
        pasteboard.clearContents()
        pasteboard.setString(tempCodeString, forType: .string)
    }
    
    // Function to validate the folder name is not empty
    func validateFolderName() -> Bool {
        if newFolderName != "" {
            return true
        } else {
            return false
        }
    }
    
    func toggleAddNoteView() {
        if showingNewNoteFromClipboardSheet {
            showingNewNoteFromClipboardSheet = false
            showingNewNoteSheet = true
        } else {
            showingNewNoteSheet = false
            showingNewNoteFromClipboardSheet = true
        }
    }

    func updateCurrentLanguage() {
        if let languageRawValue = selectedNote?.language, let programmingLanguage = ProgrammingLanguage(rawValue: languageRawValue) {
            selectedLanguage = programmingLanguage.toCodeEditorLanguage()
        }
    }
    
    func printThemes() {
        for theme in CodeEditor.availableThemes {
            print("\(theme.rawValue.capitalized)")
        }
    }
}
