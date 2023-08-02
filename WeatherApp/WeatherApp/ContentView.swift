//
//  ContentView.swift
//  WeatherApp
//
//  Created by Matthew Wong on 2023-07-31.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var weatherManager = WeatherManager()
    let city: String = "st%20louis"
    @State var iconName: String = ""
    
    var body: some View {
        let data = weatherManager.weatherData
        let data2 = data.main?.temp
        let goodData = String(data2 ?? 0.5)

        
        
        VStack {
            Text("Today's Weather")
                .font(.title)
            Text("City: \(city)")
            HStack {
                Image(systemName: iconName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 45)
                Text("\(goodData) °C")
                    .font(.system(size: 50))
                    .bold()
            }
        }
        .onAppear() {
            self.weatherManager.fetchCity(city: city)
            self.weatherManager.fetchData()
            
//            let icon = data.weather?[0].id
//            let goodIcon = icon ?? 800
//            iconName = self.weatherManager.getConditionName(weatherId: goodIcon)
//            print(goodIcon)

        }
        .onChange(of: weatherManager.weatherData) { newData in
                    let icon = newData.weather?.first?.id
                    let goodIcon = icon ?? 800
                    iconName = self.weatherManager.getConditionName(weatherId: goodIcon)
                    print(goodIcon)
                }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
