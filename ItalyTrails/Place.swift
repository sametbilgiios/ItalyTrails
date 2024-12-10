//
//  Place.swift
//  ItalyTrails
//
//  Created by samet.bilgi on 20.11.2024.
//

import Foundation
import SwiftData

@Model
final class Place: Identifiable, Equatable {
    @Attribute(.unique)
    var id: UUID
    var name: String
    var desc: String
    var visitDate: Date
    var category: String
    var imageData: Data?
    
    init(name: String, desc: String = "", visitDate: Date, category: String = "Historical", imageData: Data? = nil) {
        self.id = UUID()
        self.name = name
        self.desc = desc
        self.visitDate = visitDate
        self.category = category
        self.imageData = imageData
    }
    
    static func == (lhs: Place, rhs: Place) -> Bool {
        return lhs.id == rhs.id &&
        lhs.name == rhs.name &&
        lhs.desc == rhs.desc &&
        lhs.visitDate == rhs.visitDate &&
        lhs.category == rhs.category &&
        lhs.imageData == rhs.imageData
    }
}
