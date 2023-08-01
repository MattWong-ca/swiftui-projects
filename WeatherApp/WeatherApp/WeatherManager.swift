//
//  WeatherManager.swift
//  WeatherApp
//
//  Created by Matthew Wong on 2023-07-31.
//

import Foundation

class WeatherManager: ObservableObject {
    @Published var weatherData = WeatherData(name: nil, weather: nil, main: nil)
    let apiKey = ""
    var url: String = ""
    
//    init(weatherData: WeatherData) {
//        self.weatherData = weatherData
//    }
    
    func fetchCity(city: String) {
        url = "https://api.openweathermap.org/data/2.5/weather?appid=\(apiKey)&units=metric&q=\(city)"
        print(url)
    }
    
    func fetchData() {
        if let url = URL(string: url) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { data, response, error in
                if error == nil {
                    let decoder = JSONDecoder()
                    if let safeData = data {
                        do {
                            let results = try decoder.decode(WeatherData.self, from: safeData)
                            DispatchQueue.main.async {
                                self.weatherData = results
                            }
                        } catch {
                            print(error)
                        }
                    }
                }
            }
            task.resume()
        }
    }
}
