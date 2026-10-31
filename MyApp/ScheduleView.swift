//
//  ScheduleView.swift
//  MyApp
//
//  Created by Ryann Stock on 10/30/26.
//

import SwiftUI
import SwiftData

struct ScheduleView: View {
    
    @Query(sort: \Appointment.date) private var appointments: [Appointment]
    @Environment(\.modelContext) private var modelContext
    
    var body: some View{
        NavigationStack {
            List(appointments) {appointment in
                VStack(alignment: .leading){
                    Text(appointment.date.formatted(date: .abbreviated, time: .shortened))
                        .font(.headline)
                    Text(appointment.patient?.name ?? "No Patient")
                        .foregroundStyle(.secondary)
                }
            }
            .navigationTitle("Appointments")
            .toolbar {
                Button("Add", systemImage: "plus") {
                    let patient = Patient(name: "John Doe", focusArea: "Knee")
                    let appointment = Appointment(date: Date.now, durationMinutes: 60, notes: "Nil", patient: patient)
                    
                    modelContext.insert(patient)
                    modelContext.insert(appointment)
                    
                }
            }
        }
    }
}


#Preview {
    ScheduleView()
        .modelContainer(for: [Patient.self, Appointment.self], inMemory: true)
}
