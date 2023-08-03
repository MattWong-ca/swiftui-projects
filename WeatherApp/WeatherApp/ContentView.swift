//
//  ContentView.swift
//  WeatherApp
//
//  Created by Matthew Wong on 2023-07-31.
//

import SwiftUI
/*
struct ContentView: View {
    @ObservedObject var weatherManager = WeatherManager()
    let city: String = "toronto"
    
    var body: some View {
        let data = weatherManager.weatherData
        let data2 = data?.main.feels_like
        let goodData = String(format: "%0.1f", data2 ?? 35)
        ZStack {
            Image("cloudbackground")
            VStack {
                Text("Toronto")
                    .foregroundColor(.white)
                    .font(.title)
                    .bold()
                HStack {
                    Image(systemName: "sun.max.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 45)
                        .foregroundColor(.white)
                    Text("\(goodData) °C")
                        .font(.system(size: 50))
                        .bold()
                        .foregroundColor(.white)
                }
            }
            .onAppear() {
//                self.weatherManager.fetchCity(city: city)
                self.weatherManager.fetchCity(lat: 43.7001, lon: -79.4163)
                self.weatherManager.fetchData()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
*/
