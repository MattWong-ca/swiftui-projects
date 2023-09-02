//
//  CartView.swift
//  SweaterShop
//
//  Created by Matthew Wong on 2023-09-02.
//

import SwiftUI

struct CartView: View {
    @EnvironmentObject var cartManager: CartManager
    var body: some View {
        ScrollView {
            if cartManager.products.count > 0 {
                ForEach(cartManager.products, id: \.id) { product in
                    ProductRow(product: product)
                }
                
                HStack {
                    Text("Your cart total is: ")
                    Spacer()
                    Text("$\(cartManager.total).00")
                        .bold()
                }
                .padding()
                
                Button {
                    // Send them to confirmation page
                    // Would use PassKit for button if I had Apple Dev Account
                } label: {
                    PaymentButton()
                }
            } else {
                Text("Your cart is empty")
            }
        }
        .navigationTitle("My Cart")
        .padding(.top)
    }
}

struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        CartView()
            .environmentObject(CartManager())
    }
}
