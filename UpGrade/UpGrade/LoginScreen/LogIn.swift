//
//  LogIn.swift
//  UpGrade
//
//  Created by Victor Rodriguez on 11/20/23.
//

import SwiftUI
import UIKit
import Firebase


struct logIn: View {
    
    init() {
     // Large Navigation Title
     UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.white]
     // Inline Navigation Title
     UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.white]
   }
    
    
    
    @State private var email = ""
    @State private var password = ""
    @State private var wrongEmail = 0
    @State private var wrongPassword = 0
    @State private var showingLoginScreen = false
    var body: some View {
        NavigationView{
            ZStack{
                Color("myColor")
                    .ignoresSafeArea()
                VStack {
                    Image(systemName: "arrow.up")
                        .resizable()
                        .frame(width:60, height: 71)
                        .padding()
                        .foregroundColor(.white)
                        .offset(y:-150)
                        
                       
                     
                    
                    TextField("Enter Email:", text: $email)
                        .padding()
                        .frame(width: 300, height:30,alignment: .center)
                        .background(.white)
                        .cornerRadius(10)
                        .border(.red, width: CGFloat(wrongEmail))
                        .padding(10)
                       
                    
                    SecureField("Enter Password:", text: $password)
                        .padding()
                        .frame(width: 300, height:30,alignment: .center)
                        .background(.white)
                        .cornerRadius(10)
                        .border(.red, width: CGFloat(wrongPassword))
                        .padding(50)
                    
                    Button{
                        Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
                            if let error = error {
                                print(error)
                                return
                            }
                            
                            if let authResult = authResult {
                                print(authResult.user.uid)
                            }
                        }
                    } label: {
                        Text("Login")
                            .font(.largeTitle)
                            .bold()
                            .padding()
                            .foregroundColor(.white)
                    }
                    
                     
                    
                }
            }
            /*.navigationTitle("Login")*/
               
        }
    }
}

#Preview {
    logIn()
}
