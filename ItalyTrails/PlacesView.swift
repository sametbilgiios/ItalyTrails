//
//  PlacesView.swift
//  ItalyTrails
//
//  Created by samet.bilgi on 20.11.2024.
//

import SwiftUI
import SwiftData

struct PlacesView: View {
    
    @Environment(\.modelContext) private var modelContext
    @Query private var places: [Place]
    
    var body: some View {
        NavigationSplitView {
            List {
                ForEach(places) { place in
                    NavigationLink {
                        PlaceDetailView(place: place)
                    } label: {
                        VStack(alignment: .leading) {
                            Text(place.name)
                                .font(.headline)
                            Text(place.visitDate, format: Date.FormatStyle(date: .numeric, time: .omitted))
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                        }
                    }
                }
                .onDelete(perform: deletePlaces)
            }
            .toolbar {
                ToolbarItem(placement: .principal) {
                    VStack {
                        Text("🇮🇹")
                            .font(.title)
                    }
                }
                ToolbarItem {
                    Button(action: addPlace) {
                        Label("Add Place", systemImage: "plus")
                    }
                }
            }
        } detail: {
            Text("Select a place")
        }
    }
    
    private func addPlace() {
        withAnimation {
            let newPlace = Place(name: "New Place", visitDate: Date())
            modelContext.insert(newPlace)
        }
    }
    
    private func deletePlaces(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(places[index])
            }
        }
    }
}

#Preview {
    PlacesView()
        .modelContainer(for: Place.self, inMemory: true)
}
