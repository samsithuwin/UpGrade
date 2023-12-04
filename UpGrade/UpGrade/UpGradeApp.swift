//
//  UpGradeApp.swift
//  UpGrade
//
//  Created by Victor Rodriguez on 11/20/23.
//

import SwiftUI
import Firebase

@main
struct UpGradeApp: App {
    
    init() {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            
            ContentView()
        }
    }
}


