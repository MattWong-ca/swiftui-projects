//
//  ContentView.swift
//  MiiCard
//
//  Created by Matthew Wong on 2023-07-18.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color(red: 0.18, green: 0.80, blue: 0.44)
                .edgesIgnoringSafeArea(.all)
            VStack  {
                Image("SF-min")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 230)
                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                    .overlay(
                        Circle().stroke(Color.white, lineWidth: 5)
                    )
                Text("Matt Wong")
                    .font(Font.custom("VT323-Regular", size: 70))
                    .bold()
                    .foregroundColor(.white)
                Text("Game Developer")
                    .foregroundColor(.white)
                    .font(Font.custom("VT323-Regular", size: 50))
                                
                VStack (spacing: -10) {
                    ButtonLinkView(icon: "phone.fill", text: "416-123-7890")
                    ButtonLinkView(icon: "globe", text: "mattwong.ca")
                    ButtonLinkView(icon: "envelope.fill", text: "hi@hello.com")
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
