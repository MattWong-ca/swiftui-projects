//
//  File.swift
//  WeatherApp
//
//  Created by Matthew Wong on 2023-07-31.
//

import Foundation

struct WeatherData: Decodable, Equatable {
    let name: String?
    let weather: [Weather]?
    let main: Main?
    
    static func == (lhs: WeatherData, rhs: WeatherData) -> Bool {
            // Implement the logic to compare WeatherData instances for equatability
            // You might compare the properties that you want to consider for changes
            return lhs.name == rhs.name
//                && lhs.weather == rhs.weather
//                && lhs.main == rhs.main
                // Add more properties if needed
        }
}

struct Weather: Decodable {
    let id: Int
}

struct Main: Decodable {
    let temp: Double
}
