//
//  WeatherView.swift
//  WeatherApp
//
//  Created by Matthew Wong on 2023-08-03.
//

import SwiftUI

struct WeatherView: View {
    var weather: WeatherData
    
    var body: some View {
        ZStack(alignment: .leading) {
            Text(weather.name)
        }
        .edgesIgnoringSafeArea(.bottom)
        .background(Color(red: 0.05, green: 0.14, blue: 0.38))
        .preferredColorScheme(.dark)
    }
}

//struct WeatherView_Previews: PreviewProvider {
//    static var previews: some View {
//        WeatherView()
//    }
//}
