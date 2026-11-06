//
//  AppointmentFormView.swift
//  MyApp
//
//  Created by Ryann Stock on 10/30/26.
//

import SwiftUI
import SwiftData

struct AppointmentFormView: View {
    
    @Query(sort: \Patient.name) private var patients: [Patient]
    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) private var dismiss
    
    @State private var date = Date.now
    @State private var durationMinutes = 30
    @State private var notes = ""
    @State private var selectedPatient: Patient?
    
    var body: some View {
        NavigationStack {
            Form {
                Picker("Patient", selection: $selectedPatient){
                    Text("Select a Patient").tag(nil as Patient?)
                    ForEach(patients) {
                        patient in Text(patient.name).tag(patient as Patient?)
                    }
                }
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
                        let appointment = Appointment(date: date, durationMinutes: durationMinutes, notes: notes.isEmpty ? nil : notes, patient: selectedPatient)
                        modelContext.insert(appointment)
                        dismiss()
                    }
                    .disabled(selectedPatient == nil)
                }
            }
        }
    }
}

#Preview {
    AppointmentFormView()
        .modelContainer(for: [Patient.self, Appointment.self, AssignedExercise.self], inMemory: true)
}
