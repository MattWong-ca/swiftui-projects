//
//  WeatherManager.swift
//  WeatherApp
//
//  Created by Matthew Wong on 2023-07-31.
//

import Foundation
import CoreLocation

class WeatherManager: ObservableObject {
    @Published var weatherData: WeatherData?
    let apiKey = ""
    var url = "https://api.openweathermap.org/data/2.5/weather?units=metric"
    
//    func fetchCity(city: String) {
//        url = "\(url)&appid=\(apiKey)&q=\(city)"
//    }
    
    func fetchLiveWeather(lat: CLLocationDegrees, lon: CLLocationDegrees) {
        url = "\(url)&appid=\(apiKey)&lat=\(lat)&lon=\(lon)"
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
//                                print(self.weatherData.weather[0].id)
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
    
    func getConditionName(weatherId: Int) -> String {
        switch weatherId {
        case 200...232:
            return "cloud.bolt.fill"
        case 300...321:
            return "cloud.drizzle.fill"
        case 500...531:
            return "cloud.rain.fill"
        case 600...622:
            return "cloud.snow.fill"
        case 701...781:
            return "cloud.fog.fill"
        case 800:
            return "cloud.sun.fill"
        case 801...804:
            return "cloud.fill"
        default:
            return "questionmark.diamond.fill"
        }
    }
}
