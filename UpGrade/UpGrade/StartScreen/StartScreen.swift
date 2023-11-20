//
//  StartScreen.swift
//  UpGrade
//
//  Created by Victor Rodriguez on 11/20/23.
//

import SwiftUI

struct startScreen: View {
   
    
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
                        .padding(30)
                    
                    NavigationLink(destination:logIn()) {Text("Log In")
                            .foregroundColor(.black)
                            .frame(width: 300, height:30,alignment: .center)
                        .background(.cyan)}
                    .padding(60)
                    
                    NavigationLink(destination:createAnAccount()) {Text("Create An Account")
                            .foregroundColor(.black)
                            .frame(width: 300, height:30,alignment: .center)
                        .background(.cyan)}
                    .padding(60)
                    
                    NavigationLink(destination:logIn()) {Text("Guest Login")
                            .foregroundColor(.black)
                            .frame(width: 300, height:30,alignment: .center)
                        .background(.cyan)}
                    .padding(60)
                    
                }
            }
        }
    }
}

#Preview {
    startScreen()
}
