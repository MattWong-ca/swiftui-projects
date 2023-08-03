//
//  TestView.swift
//  WeatherApp
//
//  Created by Matthew Wong on 2023-08-02.
//

import SwiftUI

struct TestView: View {
    @StateObject var locationManager = LocationManager()
    var weatherManager = WeatherManager()
    @State var weather: WeatherData?
    
    var body: some View {
        VStack {
            // if location is nil, it's either loading or user hasn't pressed share
            if let location = locationManager.location {
                Text("Weather data fetched!")
                /*
                if let weather = weather {
                    Text("Weather data fetched!")
                } else {
                    LoadingView()
                        .task {
                            weatherManager.fetchLiveWeather(lat: location.latitude, lon: location.longitude)
                        }
                }*/
            } else {
                if locationManager.isLoading {
                    LoadingView()
                } else {
                    WelcomeView()
                        .environmentObject(locationManager)
                }
            }
        }
        .background(Color(red: 0.05, green: 0.14, blue: 0.38))
        .preferredColorScheme(.dark)
    }
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView()
    }
}
