//
//  ContentView.swift
//  WeatherApp
//
//  Created by Matthew Wong on 2023-07-31.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var weatherManager = WeatherManager()
    
    
    
    var body: some View {
        let data = weatherManager.weatherData
        let data2 = data.main?.temp
        let goodData = String(data2 ?? 0.5)
        VStack {
            Text("Today's Weather")
                .font(.title)
            Text("City: ")
            HStack {
                Image(systemName: "phone.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 45)
                Text("\(goodData) °C")
                    .font(.system(size: 50))
                    .bold()
            }
        }
        .onAppear() {
            weatherManager.fetchData()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
