//
//  WeatherData.swift
//  WeatherApp
//
//  Created by Matthew Wong on 2023-07-31.
//

import Foundation

struct WeatherData: Decodable {
    var name: String
    let weather: [Weather]
    let main: Main
    let coord: Coordinates
}

struct Weather: Decodable {
    let id: Int
}

struct Main: Decodable {
//    let temp: Double
    let feels_like: Double
}

struct Coordinates: Decodable {
    let lon: Double
    let lat: Double
}
