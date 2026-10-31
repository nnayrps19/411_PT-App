import SwiftUI

struct ContentView: View {
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
    }
}

#Preview {
    ContentView()
}

