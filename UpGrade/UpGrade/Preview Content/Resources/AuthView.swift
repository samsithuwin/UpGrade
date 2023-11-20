//
//  AuthView.swift
//  UpGrade
//
//  Created by Victor Rodriguez on 11/20/23.
//

import SwiftUI

struct AuthView: View {
    @State private var currentViewShowing: String = "login"
    
    var body: some View {
        if(currentViewShowing == "login") {
            startScreen()
        } else {
            createAnAccount()
        }
    }
}
