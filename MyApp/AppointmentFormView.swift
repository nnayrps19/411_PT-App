//
//  AppointmentFormView.swift
//  MyApp
//
//  Created by Ryann Stock on 10/30/26.
//

import SwiftUI
import SwiftData

struct AppointmentFormView: View {
    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) private var dismiss
    
    @State private var date = Date.now
    @State private var durationMinutes = 30
    @State private var notes = ""
    
    var body: some View {
        NavigationStack {
            Form {
                DatePicker("Date & Time", selection: $date)
                Stepper("Duration: \(durationMinutes) min", value: $durationMinutes, in: 30...60, step: 15)
                TextField("Notes", text: $notes)
            }
            .navigationTitle("New Appointment")
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
                ToolbarItem(placement: .confirmationAction) {
                    Button("Save") {
                        let patient = Patient(name:"John Doe", focusArea: "Knee")
                        let appointment = Appointment(date: date, durationMinutes: durationMinutes, notes: notes.isEmpty ? nil : notes, patient: patient)
                        modelContext.insert(patient)
                        modelContext.insert(appointment)
                        dismiss()
                    }
                }
            }
        }
    }
}

#Preview {
    AppointmentFormView()
        .modelContainer(for: [Patient.self, Appointment.self], inMemory: true)
}
