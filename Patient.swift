//
//  Patient.swift
//  PTCompanion
//
//  Created by Ryann Stock on 10/28/26.
//

import Foundation
import SwiftData

@Model

class Patient{
    var name: String
    var focusArea: String
    
    init(name: String, focusArea: String){
        self.name = name
        self.focusArea = focusArea
    }
}
