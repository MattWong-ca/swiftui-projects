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
                    .shadow(radius: 5)
                Text("\(temp)°")
                    .font(.system(size: 100))
                    .bold()
                    .foregroundColor(.white)
                    .shadow(radius: 5)
                HStack {
                    Text("H: \(tempMax)°")
                        .font(.system(size: 20))
                        .shadow(radius: 10)
                    Text("L: \(tempMin)°")
                        .font(.system(size: 20))
                        .shadow(radius: 5)
                }
                // TO DO
                VStack {
                    Text("testing")
                        .foregroundColor(.black)
                        .background(
                            RoundedRectangle(cornerRadius: 20)
                                .background(.ultraThinMaterial)
                                .frame(height: 300)
                                .frame(width: 500)
//                                .overlay(
//                                    HStack {
//                                        Image(systemName: "sun.max")
//                                            .resizable()
//                                            .aspectRatio(contentMode: .fit)
//                                            .frame(width: 25)
//                                            .foregroundColor(.green)
//                                        Text("text")
//                                            .foregroundColor(.white)
//                                    }
//                                )
//                                .padding(.all)
                        )
                }
                .frame(height: 300)
                .cornerRadius(20)
//                VStack {
//                    Text("testing")
//                        .foregroundColor(.black)
//                    RoundedRectangle(cornerRadius: 20)
//                        .frame(height: 300)
//                        .background(.thinMaterial)
//                        .cornerRadius(20)
//                        .foregroundColor(Color.white)
//                        .opacity(0.5)
//                        .overlay(HStack {
//                            Image(systemName: "sun.max")
//                                .resizable()
//                                .aspectRatio(contentMode: .fit)
//                                .frame(width: 25)
//                                .foregroundColor(.green)
//                            Text("text")
//                                .foregroundColor(.white)
//                        })
//                        .padding(.all)
//                }
//                .background(.ultraThinMaterial)
//                .frame(height: 300)
                Spacer()
            }
            .offset(y: 160)
        }
    }
}

// Didn't use preview since it'd require getting mocks
