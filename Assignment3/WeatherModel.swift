//
//  WeatherModel.swift
//  Assignment3
//
//  Created by Emily Denham on 3/29/24.
//

import Foundation

struct WeatherModel: Identifiable {
    let id = UUID()
    let cityName: String
    let temperature: Double
    let description: String
    let humidity: Int
    let icon: String
}

