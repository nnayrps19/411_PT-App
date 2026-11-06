//
//  AssignedExercise.swift
//  MyApp
//
//  Created by Ryann Stock on 11/5/26.
//
import Foundation
import SwiftData

@Model

class AssignedExercise {
    var wgerID: Int
    var name: String
    var sets: Int
    var reps: Int
    var holdSeconds: Int?
    var therapistNote: String?
    var lastCompleted: Date?
    var patient: Patient?
    
    init(wgerID: Int, name: String, sets: Int, reps: Int, holdSeconds: Int?, therapistNote: String?, patient: Patient?){
        self.wgerID = wgerID
        self.name = name
        self.sets = sets
        self.reps = reps
        self.holdSeconds = holdSeconds
        self.therapistNote = therapistNote
        lastCompleted = nil
        self.patient = patient
        
    }
}


