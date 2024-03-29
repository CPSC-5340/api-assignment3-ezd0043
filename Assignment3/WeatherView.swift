//
//  WeatherView.swift
//  Assignment3
//
//  Created by Emily Denham on 3/29/24.
//

import SwiftUI
import Foundation

struct WeatherView: View {
    @ObservedObject var viewModel = WeatherViewModel()

    var body: some View {
        NavigationStack {
            List(viewModel.weatherData, id: \.id) { weather in
                NavigationLink(destination: WeatherDetailView(weather: weather)) {
                    VStack(alignment: .leading) {
                        Text(weather.cityName).font(.headline)
                        Text("\(weather.temperature, specifier: "%.1f")° - \(weather.description)")
                    }
                }
            }
            .navigationTitle("Weather")
            .task {
                viewModel.loadWeatherForAllCities()
            }            .alert("Error", isPresented: $viewModel.hasError) {
                Button("OK", role: .cancel) { }
            } message: {
                Text(viewModel.errorMessage)
            }
        }
    }
}
