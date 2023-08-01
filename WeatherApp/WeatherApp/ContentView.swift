//
//  ContentView.swift
//  WeatherApp
//
//  Created by Matthew Wong on 2023-07-31.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("Today's Weather")
                .font(.title)
            Text("City: ")
            HStack {
                Image(systemName: "phone.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 45)
                Text("25 °C")
                    .font(.system(size: 50))
                    .bold()
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
