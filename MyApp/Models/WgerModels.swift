//
//  WgerModels.swift
//  MyApp
//
//  Created by Ryann Stock on 11/6/26.
//

import Foundation

struct WgerResponse : Codable {
    let count : Int
    let results : [WgerExercise]
}

struct WgerExercise : Codable, Identifiable {
    let id : Int
    let category : WgerCategory
    let muscles : [WgerMuscle]
    let translations : [WgerTranslation]
    
    var englishName: String {
        translations.first {$0.language == 2}?.name ?? "Unnamed exercise"
    }
    
    var englishDescription: String {
        translations.first {$0.language == 2}?.descriptionSource ?? "No instruction available"
    }
}

struct WgerCategory : Codable {
    let name : String
}

struct WgerMuscle : Codable, Identifiable {
    let id : Int
    let name : String
    let nameEn : String
    
}

struct WgerTranslation : Codable {
    let name : String
    let language : Int
    let descriptionSource : String
}


