//
//  WeatherDetailView.swift
//  Assignment3
//
//  Created by Emily Denham on 3/29/24.
//

import Foundation
import SwiftUI

struct WeatherDetailView: View {
    var weather: WeatherModel

    var body: some View {
        VStack {
            Text(weather.cityName).font(.largeTitle)
            Text("\(weather.temperature, specifier: "%.1f")°").font(.system(size: 70))
            Text(weather.description)
            HStack {
                Text("Humidity: \(weather.humidity)%")
            }
            Spacer()
        }
        .padding()
        .navigationTitle("Details")
    }
}
