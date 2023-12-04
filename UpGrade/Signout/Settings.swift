//
//  Settings.swift
//  UpGrade
//
//  Created by Victor Rodriguez on 12/4/23.
//

import SwiftUI

struct Settings: View {
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                VStack() {
                    
                    
                    GroupBox (
                        label:
                            Label("Fructus", systemImage:"info.circle")
                    ) {
                        Divider () .padding (.vertical, 4)
                        HStack(alignment: .center, spacing: 10) {
                            Image("Flower")
                                .resizable ()
                                .scaledToFit () 
                                .frame (width: 80, height: 80)
                                .cornerRadius (9)
                            Text ("Welcome to UpGrade. We want our customers to be the best gamers with our resoucres.")
                                .font(.body)
                        }
                    }
                    
                    GroupBox (
                        label:
                            Label("Application", systemImage:"iphone")
                    ) {
                        Divider () .padding (.vertical, 4)
                        
                        HStack {
                            Text("Developer")
                                .foregroundColor(Color.gray)
                            Spacer()
                            Text("Victor")
                        }
                        
                        HStack {
                            Text("Designer")
                                .foregroundColor(Color.gray)
                            Spacer()
                            Text("Victor")
                        }
                        
                        HStack {
                            Text("Compatibility")
                                .foregroundColor(Color.gray)
                            Spacer()
                            Text("Victor")
                        }
                        
                        HStack {
                            Text("Website")
                                .foregroundColor(Color.gray)
                            Spacer()
                            Link("UpGrade Website", destination: URL(string: "supgrade.com")!)                       }
                        
                        
                        HStack {
                            Text("Twitter")
                                .foregroundColor(Color.gray)
                            Spacer()
                            Text("")
                        }
                        
                        HStack {
                            Text("Swiftui")
                                .foregroundColor(Color.gray)
                            Spacer()
                            Text("2.0")
                        }
                        
                        HStack {
                            Text("Version")
                                .foregroundColor(Color.gray)
                            Spacer()
                            Text("1.0")
                        }
                    }
                    
                }
                .navigationTitle("About Us")
                
                
                
                
                
                
                
                
                //            Form {
                //
                //                Section(header:Text("Display")) {
                //
                //                    Toggle(isOn: .constant(true),
                //                           label: {
                //                        Text("Dark Mode")
                //                    })
                //
                //                    Toggle(isOn: .constant(true),
                //                           label: {
                //                        Text("Use System Settings")
                //                    })
                //                }
                //            }
            }
        }
      
    }
}


#Preview {
    Settings()
}
