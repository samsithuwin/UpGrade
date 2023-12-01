//
//  SignOut.swift
//  UpGrade
//
//  Created by Victor Rodriguez on 11/27/23.
//

import SwiftUI
import Firebase

struct SignOut: View {
    
    @State var signedOut = false
    @State var isPresenting: Bool = false
    
    func handleLogOut(){
        do {
            try Auth.auth().signOut()
            signedOut.toggle()
        } catch {
            print("Error signing out: \(error.localizedDescription)")
        }
    }
    
    
    var body: some View {
        
        if signedOut {
            ContentView()
        } else {
            content
        }
    }

    @ViewBuilder
    var content: some View {
        NavigationView {
            
        
            
            Button {
                handleLogOut()
            } label: {
                Text ("Sign out")
            }
        }
        .navigationTitle("Profile")
    }
}



#Preview {
    NavigationStack {
        SignOut()
    }
}


