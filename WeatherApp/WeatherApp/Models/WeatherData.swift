//
//  WeatherData.swift
//  WeatherApp
//
//  Created by Matthew Wong on 2023-07-31.
//

import Foundation

struct WeatherData: Decodable {
    let name: String
    let weather: [Weather]
    let main: Main
}

struct Weather: Decodable {
    let id: Int
}

struct Main: Decodable {
    let feels_like: Double
    let temp_min: Double
    let temp_max: Double
}
