//
//  PTCompanion.swift
//  Files.xcfilescontainer
//
//  Created by Ryann Stock on 10/28/26.
//

import Foundation
import SwiftUI
import SwiftData

@main

struct PTCompanionApp: App {
    var body: some Scene {
        WindowGroup{
            ContentView()
        }
        .modelContainer(for: [Patient.self, Appointment.self])
    }
}

