//
//  ExerciseDetailView.swift
//  MyApp
//
//  Created by Ryann Stock on 11/20/26.
import SwiftUI
import SwiftData

struct ExerciseDetailView: View {
    
    let exercise: WgerExercise
    
    var body: some View {
        List {
            Section("Category") {
                Text(exercise.category.name)
            }
            Section("Muscles worked") {
                ForEach(exercise.muscles){muscle in
                    Text(muscle.nameEn.isEmpty ? muscle.name : muscle.nameEn)
                }
            }
            Section("Instructions"){
                Text(exercise.englishDescription)
            }
        }
        .navigationTitle(exercise.englishName)
    }
}

#Preview{
    NavigationStack {
        ExerciseDetailView(exercise: WgerExercise(
            id: 1,
            category: WgerCategory(name: "Legs"),
            muscles: [WgerMuscle(id: 10, name: "Quadriceps femoris", nameEn: "Quads")],
            translations: [WgerTranslation(name: "Squats", language: 2,
                           descriptionSource: "Stand with your feet shoulder width apart...")]
        ))
    }
}
