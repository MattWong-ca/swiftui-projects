//
//  PaymentButton.swift
//  SweaterShop
//
//  Created by Matthew Wong on 2023-09-02.
//

import SwiftUI

struct PaymentButton: View {
    var body: some View {
        Rectangle()
            .fill(.black)
            .frame(maxWidth: .infinity)
            .frame(height: 40)
            .overlay(
                HStack {
                    Image(systemName: "apple.logo")
                        .foregroundColor(.white)
                    Text("Checkout with Apple Pay")
                        .bold()
                    .foregroundColor(.white)
                }
            )
            .cornerRadius(10)
            .padding(20)
    }
}

struct PaymentButton_Previews: PreviewProvider {
    static var previews: some View {
        PaymentButton()
    }
}
