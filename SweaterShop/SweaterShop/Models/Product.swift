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

var productList = [ Product(name: "Zesty Orange", image: "sweater1", price: 39),
                    Product(name: "Ivory Intrigue", image: "sweater4", price: 39),
                    Product(name: "Beige Bliss", image: "sweater3", price: 29),
                    Product(name: "Mossy Magic", image: "sweater2", price: 39),
                    Product(name: "Fairy Floss", image: "sweater5", price: 39),
                    Product(name: "Silver Lining", image: "sweater6", price: 39),
                    Product(name: "Maroon Marvel", image: "sweater7", price: 29),
                    Product(name: "Lavender Skies", image: "sweater8", price: 39)]
