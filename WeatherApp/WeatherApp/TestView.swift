//
//  TestView.swift
//  WeatherApp
//
//  Created by Matthew Wong on 2023-08-02.
//

import SwiftUI

struct TestView: View {
    @StateObject var locationManager = LocationManager()
    @ObservedObject var weatherManager = WeatherManager()
//    @State var weather: WeatherData?
    
    var body: some View {
        VStack {
            // if location is nil, it's either loading or user hasn't pressed share
            if let location = locationManager.location {
                if let weatherr = weatherManager.weatherData {
                    WeatherView(weather: weatherr)
                } else {
                    LoadingView()
                        .task {
                            self.weatherManager.fetchLiveWeather(lat: location.latitude, lon: location.longitude)
                            self.weatherManager.fetchData()
                        }
                }
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
