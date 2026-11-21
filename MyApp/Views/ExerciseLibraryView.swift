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
    @State private var isLoading = false
    @State private var errorMessage: String? = nil
    
    var body: some View{
        NavigationStack{
            List(exercises) { exercise in
                NavigationLink {
                    ExerciseDetailView(exercise: exercise)
                } label: {
                    VStack(alignment: .leading){
                        Text(exercise.englishName)
                            .font(.headline)
                        Text(exercise.category.name)
                            .foregroundStyle(.secondary)
                    }
                }
            }
            .navigationTitle("Exercises")
            .searchable(text: $searchExercise, prompt: "Search exercises")
            .onSubmit(of: .search) {
                Task {
                    await search()
                }
            }
            
            .overlay {
                if isLoading {
                    ProgressView("Searching ...")
                } else if let errorMessage {
                    ContentUnavailableView("Search failed",
                                           systemImage: "wifi.exclamationmark",
                                           description: Text(errorMessage))
                }else if exercises.isEmpty {
                    ContentUnavailableView("Search for an exercise",
                                           systemImage: "magnifyingglass")
                }
            }
        }
    }
    
    private func search() async {
        
        isLoading = true
        errorMessage = nil
        
        do {
            exercises = try await WgerService.searchExercises(term: searchExercise)
        } catch {
            
            errorMessage = "Could not load exercises. Please check your connection and try again."
            print("Error: \(error)")
        }
        
        isLoading = false
    }
    
    
    
}

#Preview {
    ExerciseLibraryView()
}
