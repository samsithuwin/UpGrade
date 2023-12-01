//
//  HomeScreen.swift
//  UpGrade
//
//  Created by Victor Rodriguez on 12/1/23.
//

import SwiftUI



struct HomeScreen: View {
    
    @State var isPresenting: Bool = false
    @State var searchText: String = ""
    
    
    var body: some View {
        
        var columns = [GridItem(.adaptive(minimum: 160), spacing: 20)]
        
        NavigationView{
            ScrollView {
                LazyVGrid(columns: columns, spacing:20) {
                    ForEach(productList, id: \.id) { product in ProductCard(product: product)
                    }
                }
                .padding()
                
                    .toolbar {
                        ToolbarItem(placement: .topBarTrailing) {
                            NavigationLink {
                                SignOut()
                            } label: {
                                Image(systemName: "person.circle")
                            }
                        }
                        
                        ToolbarItem(placement: .topBarLeading) {
                           CartButton(numberOfProducts: 1)
                        }
                        
                    }

            }.navigationTitle("UpGrade")
                .navigationBarTitleDisplayMode(.inline)
        }
        .sheet(isPresented: $isPresenting ) {
            NavigationView {
                SignOut()
            }
        }
        .searchable(text: $searchText)
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    HomeScreen()
}
