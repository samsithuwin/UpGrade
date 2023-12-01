//
//  Product.swift
//  UpGrade
//
//  Created by Victor Rodriguez on 12/1/23.
//

import Foundation

struct Product: Identifiable {
    var id = UUID()
    var name: String
    var image: String
    var price: Int
}

var productList = [
    Product(name: "Black KB", image: "Black", price: 50),
    Product(name: "Gray KB", image: "Gray", price: 50),
    Product(name: "White KB", image: "White", price: 50),
    Product(name: "Trash KB", image: "Trash", price: 10)
]
