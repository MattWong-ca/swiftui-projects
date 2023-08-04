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
    let apiKey = "5a280e93c19a551e92bb49fb3da7757f"
    var url = "https://api.openweathermap.org/data/2.5/weather?units=metric"
    
    func fetchLiveWeather(lat: CLLocationDegrees, lon: CLLocationDegrees) {
        if apiKey == "" { print("Forgot API key!!!") }
        url = "\(url)&appid=\(apiKey)&lat=\(lat)&lon=\(lon)"
        
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
    
    func getIconFromId(weatherId: Int) -> String {
        switch weatherId {
        case 200...232:
            return "lightning"
        case 300...321:
            return "rain"
        case 500...531:
            return "rain"
        case 600...622:
            return "snow"
        case 701...781:
            return "fog"
        case 800:
            return "sunny"
        case 801...804:
            return "cloudbackground"
        default:
            return "cloudbackground"
        }
    }
}
