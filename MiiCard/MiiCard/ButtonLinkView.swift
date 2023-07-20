//
//  ButtonLinkView.swift
//  MiiCard
//
//  Created by Matthew Wong on 2023-07-18.
//

import SwiftUI

struct ButtonLinkView: View {
    
    let icon: String
    let text: String
    
    var body: some View {
        RoundedRectangle(cornerRadius: 20)
            .frame(height: 60)
            .foregroundColor(Color.white)
            .overlay(HStack {
                Image(systemName: icon)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 25)
                    .foregroundColor(.green)
                Text(text).font(Font.custom("VT323-Regular", size: 30))
            })
            .padding(.all)
    }
}

struct ButtonLinkView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonLinkView(icon: "person.crop.circle.fill", text: "LinkedIn")
    }
}
