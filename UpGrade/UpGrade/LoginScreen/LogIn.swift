//
//  LogIn.swift
//  UpGrade
//
//  Created by Victor Rodriguez on 11/20/23.
//

import SwiftUI
import Firebase


struct logIn: View {
    @State private var email = ""
    @State private var password = ""
    @State private var wrongEmail = 0
    @State private var wrongPassword = 0
    @State private var showingLoginScreen = false
    @State private var userIsLoggedIn = false
    
    
    var body: some View {
        NavigationView{
            ZStack{
                Color("myColor")
                    .ignoresSafeArea()
                VStack(spacing: 20)  {
                    Image(systemName: "arrow.up")
                        .resizable()
                        .frame(width:60, height: 70)
                        .padding()
                        .foregroundColor(.white)
                        .offset(y:-150)
                    
                    TextField("Email:", text: $email)
                        .foregroundColor(.white)
                        .textFieldStyle(.plain)
                        .placeholder(when: email.isEmpty) {
                            Text("Email")
                                .foregroundColor(.white)
                                .bold()
                        }
                    
                    Rectangle()
                        .frame(width:350, height:1)
                        .foregroundColor(.white)
                    
                    SecureField("Password:", text: $password)
                        .foregroundColor(.white)
                        .placeholder(when: password.isEmpty)
                    {
                        Text("Password")
                            .foregroundColor(.white)
                            .bold()
                    }
                    
                    Rectangle()
                        .frame(width:350, height:1)
                        .foregroundColor(.white)
                    
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
                        Text("Log In")
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
                        ContentView()
                    } label: {
                        Text("Need an Account? Press Here")
                            .bold()
                            .foregroundColor(.white)
                    }
                    .padding()
                    .offset(y:110)

                    

                }
                .frame(width:350)
                    .onAppear(){
                        Auth.auth().addStateDidChangeListener { auth, user in if user != nil {
                            userIsLoggedIn.toggle()
                            }
                        }
                    }
            }
        }
        .navigationBarHidden(true)

        .ignoresSafeArea()
    }
    
    
}



#Preview {
    logIn()
}

