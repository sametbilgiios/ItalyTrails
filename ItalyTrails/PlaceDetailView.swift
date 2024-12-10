//
//  PlaceDetailView.swift
//  ItalyTrails
//
//  Created by samet.bilgi on 20.11.2024.
//

import SwiftUI
import SwiftData

struct PlaceDetailView: View {
    
    @Environment(\.dismiss) private var dismiss
    
    @Bindable var place: Place
    
    @State private var tempPlace: Place
    @State private var isShowingAlert = false
    
    init(place: Place) {
        self.place = place
        _tempPlace = State(initialValue: Place(name: place.name, desc: place.desc, visitDate: place.visitDate, category: place.category, imageData: place.imageData))
    }
    
    var body: some View {
        Form {
            Section(header: Text("Place Details")) {
                TextField("Place Name", text: $place.name)
                TextEditor(text: $place.desc)
                    .frame(height: 100)
            }
            
            Section(header: Text("Visit Date")) {
                DatePicker("Date", selection: $place.visitDate, displayedComponents: .date)
            }
            
            Section(header: Text("Category")) {
                Picker("Category", selection: $place.category) {
                    Text("Historical").tag("Historical")
                    Text("Natural").tag("Natural")
                    Text("Artistic").tag("Artistic")
                }
                .pickerStyle(SegmentedPickerStyle())
            }
        }
        .navigationTitle(place.name)
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button(action: {
                    handleBackButton()
                }) {
                    Image(systemName: "chevron.left")
                }
            }
        }
        .alert("You have unsaved changes. Do you want to save them?", isPresented: $isShowingAlert, actions: {
            Button("Discard Changes", role: .destructive, action: {
                discardChanges()
                dismiss()
            })
            Button("Save Changes", role: .cancel, action: {
                dismiss()
            })
        })
    }
    
    private func handleBackButton() {
        if hasUnsavedChanges() {
            isShowingAlert = true
        } else {
            dismiss()
        }
    }
    
    private func hasUnsavedChanges() -> Bool {
        return place.name != tempPlace.name ||
        place.desc != tempPlace.desc ||
        place.visitDate != tempPlace.visitDate ||
        place.category != tempPlace.category ||
        place.imageData != tempPlace.imageData
    }
    
    private func discardChanges() {
        place.name = tempPlace.name
        place.desc = tempPlace.desc
        place.visitDate = tempPlace.visitDate
        place.category = tempPlace.category
        place.imageData = tempPlace.imageData
    }
}
