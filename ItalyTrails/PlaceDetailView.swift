//
//  PlaceDetailView.swift
//  ItalyTrails
//
//  Created by samet.bilgi on 20.11.2024.
//

import SwiftUI
import SwiftData

struct PlaceDetailView: View {
    
    @Bindable var place: Place
    
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
    }
}
