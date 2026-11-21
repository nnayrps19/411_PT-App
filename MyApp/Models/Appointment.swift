//
//  Appointment.swift
//  
//
//  Created by Ryann Stock on 10/28/26.
//

import Foundation
import SwiftData

@Model

class Appointment{
    var date: Date
    var durationMinutes: Int
    var notes: String?
    var patient: Patient?
    
    init(date: Date, durationMinutes: Int, notes: String?, patient: Patient?) {
        self.date = date
        self.durationMinutes = durationMinutes
        self.notes = notes
        self.patient = patient
    }
}
