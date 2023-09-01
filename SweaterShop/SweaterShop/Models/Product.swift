//
//  Product.swift
//  SweaterShop
//
//  Created by Matthew Wong on 2023-08-31.
//

import Foundation

struct Product: Identifiable {
    var id = UUID()
    var name: String
    var image: String
    var price: Int
}

var productList = [ Product(name: "Orange", image: "sweater1", price: 59),
                    Product(name: "Summer", image: "sweater2", price: 59),
                    Product(name: "Winter", image: "sweater3", price: 59),
                    Product(name: "Maroon", image: "sweater4", price: 59),
                    Product(name: "Green", image: "sweater5", price: 59)]
