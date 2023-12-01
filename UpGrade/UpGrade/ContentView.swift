//
//  ContentView.swift
//  UpGrade
//
//  Created by Victor Rodriguez on 11/20/23.


import SwiftUI
import UIKit
import Firebase
import FirebaseFirestore

struct ContentView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var wrongEmail = 0
    @State private var wrongPassword = 0
    @State private var showingLoginScreen = false
    @State private var userIsLoggedIn = false
    @State public var UID = ""
    @State var StatusMessage = ""
    
    func register(){
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            
            if let error = error {
                print(error)
                return
            }
            if let authResult = authResult {
                print(authResult.user.uid)
                UID = authResult.user.uid
            }
        }
    }
    
    
    private func isVaildPassword (_ password: String) -> Bool
    {
        let passwordRegex = NSPredicate(format: "SELF MATCHES %@", "^(?=.*[a-z])(?=.*[$@$#!%*?&])(?=.*[A-Z]).{6,}$")
        return passwordRegex.evaluate(with: password)
    }
    
    private func storeUserInformation() {
        guard let uid = Auth.auth().currentUser?.uid else {return}
        let userData = ["email": self.email, "password": self.password, "uid": uid]
        Firestore.firestore().collection("user")
            .document(uid).setData(userData) {error in if let error = error {
                print(error)
                self.StatusMessage = "\(error)"
                return
            }
            }
    }
        var body: some View {
            if userIsLoggedIn {
                HomeScreen()
            } else {
                content
            }
        }
    
    var content: some View{
        NavigationView{
            ZStack{
                Color("myColor")
                    .ignoresSafeArea()
                VStack(spacing: 20) {
                    Image(systemName: "arrow.up")
                        .resizable()
                        .frame(width:60, height: 70)
                        .padding()
                        .foregroundColor(.white)
                        .offset(y:-150)
                    
                    HStack {
                        TextField("Email:", text: $email)
                            .foregroundColor(.white)
                            .textFieldStyle(.plain)
                            .placeholder(when: email.isEmpty) {
                                Text("Email")
                                    .foregroundColor(.white)
                                    .bold()
                            }
                        
                        
                        Spacer()
                        
                        if (email.count != 0) {
                            
                            Image(systemName: email.isValidEmail() ?  "checkmark" : "xmark")
                                .fontWeight(.bold)
                                .foregroundColor(email.isValidEmail() ? .green : .red)
                        }
                    }
                    
                    Rectangle()
                        .frame(width:350, height:1)
                        .foregroundColor(.white)
                    
                    
                    HStack{
                        
                        SecureField("Password:", text: $password)
                            .foregroundColor(.white)
                            .placeholder(when: password.isEmpty)
                        {
                            Text("Password")
                                .foregroundColor(.white)
                                .bold()
                        }
                        
                        Spacer()
                        
                        if (password.count != 0) {
                            Image(systemName:isVaildPassword(password) ? "checkmark" : "xmark")
                                .fontWeight(.bold)
                                .foregroundColor(isVaildPassword(password) ? .green : .red)
                        }
                        
                        
                    }
                    Rectangle()
                        .frame(width:350, height:1)
                        .foregroundColor(.white)
                    
                    
                    
                    Button {
                        register()
                    } label: {
                        Text("Sign Up")
                            .bold()
                            .frame(width:200, height:40)
                            .background(
                                RoundedRectangle(cornerRadius: 10, style: .continuous)
                                    .fill(.linearGradient(colors: [.pink, .red], startPoint: .top, endPoint: .bottomTrailing))
                            )
                            .foregroundColor(.white)
                    }
                    .padding(.top)
                    .offset(y:100)
                    
                    
                   
                    
                    
                    NavigationLink {
                        logIn()
                    } label: {
                        Text("Already have an account? Login")
                            .bold()
                            .foregroundColor(.white)
                    }
                    .padding()
                    .offset(y:110)
                    
                }.frame(width:350)
                    .onAppear(){
                        Auth.auth().addStateDidChangeListener { auth, user in if user != nil {
                            userIsLoggedIn.toggle()
                            }
                        }
                    }
                
                
            }
        }.navigationBarHidden(true)

        .ignoresSafeArea()
        
    }
    
   
}
#Preview {
    ContentView()
}

extension View {
    func placeholder<Content: View>(
        when shouldshow: Bool,
        alignment: Alignment = .leading,
        @ViewBuilder placeholder: () -> Content) -> some View {
            
            ZStack(alignment: alignment) {
                placeholder().opacity(shouldshow ? 1 : 0 )
                self
            }
        }
}
