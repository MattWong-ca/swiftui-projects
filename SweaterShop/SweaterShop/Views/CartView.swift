//
//  CartView.swift
//  SweaterShop
//
//  Created by Matthew Wong on 2023-09-02.
//

import SwiftUI

struct CartView: View {
    var body: some View {
        ScrollView {
            Text("Your cart is empty")
        }
        .navigationTitle("My Cart")
        .padding(.top)
    }
}

struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        CartView()
    }
}
