//
//  WeatherView.swift
//  WeatherApp
//
//  Created by Matthew Wong on 2023-08-03.
//

import SwiftUI

struct WeatherView: View {
    var weather: WeatherData
    let weatherManager = WeatherManager()
    
    var body: some View {
        let city = weather.name
        
        let temp = Int(round(weather.main.feels_like))
        let tempMax = Int(round(weather.main.temp_max))
        let tempMin = Int(round(weather.main.temp_min))
        
        let icon = weatherManager.getIconFromId(weatherId: weather.weather[0].id)
        
        ZStack {
            Image(icon)
                .resizable()
                .edgesIgnoringSafeArea(.all)
            VStack {
                Text(city)
                    .foregroundColor(.white)
                    .font(.title)
                    .bold()
                Text("\(temp)°")
                    .font(.system(size: 100))
                    .bold()
                    .foregroundColor(.white)
                HStack {
                    Text("H: \(tempMax)°")
                        .font(.system(size: 20))
                    Text("L: \(tempMin)°")
                        .font(.system(size: 20))
                }
                /* TO DO
                VStack {
                    RoundedRectangle(cornerRadius: 20)
                        .frame(height: 60)
                        .foregroundColor(Color.white)
                        .opacity(0.5)
                        .overlay(HStack {
                            Image(systemName: "sun.max")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 25)
                                .foregroundColor(.green)
                            Text("text")
                                .foregroundColor(Color.gray)
                                
                        })
                        .padding(.all)
                }*/
                Spacer()
            }
            .offset(y: 160)
        }
    }
}

// Didn't use preview since it'd require getting mocks
