//
//  ExerciseLibraryView.swift
//  MyApp
//
//  Created by Ryann Stock on 10/30/26.
//

import SwiftUI

struct ExerciseLibraryView: View {
    
    @State private var searchExercise = ""
    @State private var exercises: [WgerExercise] = []
    
    var body: some View{
        NavigationStack {
            List(exercises) { exercise in
                VStack(alignment: .leading){
                    Text(exercise.englishName)
                        .font(.headline)
                    Text(exercise.category.name)
                        .foregroundStyle(.secondary)
                }
            }
            .navigationTitle("Exercises")
            .searchable(text: $searchExercise, prompt: "Search exercises")
            .onSubmit(of: .search) {
                Task {
                    await search()
                }
            }
            
        }
        
    }
    
    private func search() async {
        do {
            exercises = try await WgerService.searchExercises(term: searchExercise)
        } catch {
            print("Error: \(error)")
        }
    }
    
       
}

#Preview {
}
