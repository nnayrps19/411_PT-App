//
//  ExerciseLibraryView.swift
//  MyApp
//
//  Created by Ryann Stock on 10/30/26.
//

import SwiftUI

struct ExerciseLibraryView: View {
    var body: some View{
        Text("Exercise Library View")
            .task {
                do {
                    let results = try await WgerService.searchExercises(term: "squat")
                    print("Found \(results.count) exercises")
                } catch {
                    print("Error \(error)")
                }
            }
    }
    
       
}

#Preview {
    ExerciseLibraryView()
}
