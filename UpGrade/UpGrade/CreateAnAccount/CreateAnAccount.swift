
//  StartScreen.swift
//  UpGrade
//
//  Created by Victor Rodriguez on 11/20/23.
//

import SwiftUI
import FirebaseAuth
//import UIKit


struct createAnAccount: View {
    
//    init() {
//        // Large Navigation Title
//        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.white]
//        // Inline Navigation Title
//        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.white]
//    }
    
    @State private var email = ""
    @State private var password = ""
    @State private var wrongEmail = 0
    @State private var wrongPassword = 0
    @State private var showingLoginScreen = false
    @State private var userIsLoggedIn = false
    
    func register(){
        Auth.auth().createUser(withEmail: email, password: password)
        { result, error in if let error = error {
            print(error)
        }
        }
    }
    
    private func isVaildPassword (_ password: String) -> Bool
    {
        let passwordRegex = NSPredicate(format: "SELF MATCHES %@", "^(?=.*[a-z])(?=.*[$@$#!%*?&])(?=.*[A-Z]).{6,}$")
        return passwordRegex.evaluate(with: password)
        
    }
    
    var body: some View {
        NavigationView{
            ZStack{
                Color("myColor")
                    .ignoresSafeArea()
                VStack {
                    Image(systemName: "arrow.up")
                        .resizable()
                        .frame(width:60, height: 70)
                        .padding()
                        .foregroundColor(.white)
                        .offset(y:-150)
                    
                    HStack {
                        TextField("Enter Email:", text: $email)
                        
                        Spacer()
                        
                        if (email.count != 0) {
                            
                            Image(systemName: email.isValidEmail() ?  "checkmark" : "xmark")
                                .fontWeight(.bold)
                                .foregroundColor(email.isValidEmail() ? .green : .red)
                        }
                    }
                    .padding()
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(lineWidth: 2)
                            .foregroundColor(.black)
                    ).background(.white)
                        .padding()
                    
                    HStack{
                        
                        SecureField("Enter Password:", text: $password)
                        Spacer()
                        if (password.count != 0) {
                            Image(systemName:isVaildPassword(password) ? "checkmark" : "xmark")
                                .fontWeight(.bold)
                                .foregroundColor(isVaildPassword(password) ? .green : .red)
                        }
                        
                        
                    }
                    .padding()
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(lineWidth: 2)
                            .foregroundColor(.black)
                    ).background(.white)
                        .padding()
                    
                    Button{
                        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
                            
                            if let error = error {
                                print(error)
                                return
                            }
                            if let authResult = authResult {
                                print(authResult.user.uid)
                            }
                        }
                    } label: {
                        Text("Create An Account")
                            .font(.largeTitle)
                            .bold()
                            .padding()
                            .foregroundColor(.white)
                    }
                    .onAppear(){
                        Auth.auth().addStateDidChangeListener { auth, user in if user != nil {
                            userIsLoggedIn.toggle()
                            }
                        }
                    }
                }
            }
        }
        
    }
}

#Preview {
    createAnAccount()
}
