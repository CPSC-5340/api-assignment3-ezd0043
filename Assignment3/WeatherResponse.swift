//
//  WeatherResponse.swift
//  Assignment3
//
//  Created by Emily Denham on 3/29/24.
//
import Foundation

struct WeatherResponse: Codable {
    let weather: [WeatherInfo]
    let main: MainInfo
    let name: String
}

struct WeatherInfo: Codable {
    let description: String
    let icon: String
}

struct MainInfo: Codable {
    let temp: Double
    let humidity: Int
}
