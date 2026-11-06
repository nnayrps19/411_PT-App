import SwiftUI
import SwiftData


struct ContentView: View {
    
    
    @Environment(\.modelContext) private var modelContext
    @Query private var patients: [Patient]
    
    var body: some View{
        TabView {
            TodayView()
                .tabItem { Label("Today", systemImage: "sun.max")}
            
            ScheduleView()
                .tabItem { Label("Schedule", systemImage: "calendar")}
            
            ExerciseLibraryView()
                .tabItem{ Label("Exercise Library", systemImage: "figure.run")}
            
            SettingsView()
                .tabItem { Label("Settings", systemImage: "gearshape")}
        }
        .task {
            if patients.isEmpty {
                let first = Patient(name: "Raul Cruz", focusArea: "Shoulder")
                let second = Patient(name: "Victor Mendoza", focusArea: "Hand")
                let third = Patient(name: "Paul Stock", focusArea: "Finger")
                
                let firstExercise = AssignedExercise(wgerID: 01, name: "Squat", sets: 2, reps: 10, holdSeconds: 3, therapistNote: nil, patient: first)
                let secondExercise = AssignedExercise(wgerID: 01, name: "Bench Press", sets: 2, reps: 10, holdSeconds: 3, therapistNote: nil, patient: second)
                let thirdExercise = AssignedExercise(wgerID: 01, name: "Deadlift", sets: 2, reps: 10, holdSeconds: 3, therapistNote: nil, patient: third)
                
                modelContext.insert(first)
                modelContext.insert(firstExercise)
                modelContext.insert(second)
                modelContext.insert(secondExercise)
                modelContext.insert(third)
                modelContext.insert(thirdExercise)
            }
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: [Patient.self, Appointment.self, AssignedExercise.self], inMemory: true)
}

