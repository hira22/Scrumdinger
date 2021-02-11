//
//  History.swift
//  Scrumdinger
//
//  Created by hiraoka on 2021/02/10.
//

import Foundation

struct History: Identifiable, Codable {
    internal init(id: UUID = UUID(), date: Date = Date(), attendees: [String], lengthInMinutes: Int) {
        self.id = id
        self.date = date
        self.attendees = attendees
        self.lengthInMinutes = lengthInMinutes
    }
    
    let id: UUID
    let date: Date
    let attendees: [String]
    let lengthInMinutes: Int
    
    
}
