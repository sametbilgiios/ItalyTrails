//
//  Place.swift
//  ItalyTrails
//
//  Created by samet.bilgi on 20.11.2024.
//

import Foundation
import SwiftData

@Model
final class Place {
    
    var name: String
    var desc: String
    var visitDate: Date
    var category: String
    var imageData: Data?
    
    init(name: String, desc: String = "", visitDate: Date, category: String = "Historical", imageData: Data? = nil) {
        self.name = name
        self.desc = desc
        self.visitDate = visitDate
        self.category = category
        self.imageData = imageData
    }
}
