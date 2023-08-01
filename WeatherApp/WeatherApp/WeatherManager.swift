//
//  WeatherManager.swift
//  WeatherApp
//
//  Created by Matthew Wong on 2023-07-31.
//

import Foundation

let processInfo = ProcessInfo.processInfo
let environment = processInfo.environment

class WeatherManager: ObservableObject {
    @Published var weatherData: WeatherData
    let apiKey = environment["API_KEY"]
    
    init(weatherData: WeatherData) {
        self.weatherData = weatherData
    }
    
    func fetchData() {
        if let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?appid=\(apiKey!)&units=metric&q=\(weatherData.name)") {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { data, response, error in
                if error == nil {
                    let decoder = JSONDecoder()
                    if let safeData = data {
                        do {
                            let results = try decoder.decode(WeatherData.self, from: safeData)
                            // To do
                        }
                    }
                }
            }
        }
    }
}
