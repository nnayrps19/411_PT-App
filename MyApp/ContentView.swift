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
                modelContext.insert(first)
                modelContext.insert(second)
                modelContext.insert(third)
            }
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: [Patient.self, Appointment.self], inMemory: true)
}

