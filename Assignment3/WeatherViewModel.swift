//
//  WeatherViewModel.swift
//  Assignment3
//
//  Created by Emily Denham on 3/29/24.
//

import Foundation

class WeatherViewModel: ObservableObject {
    @Published var weatherData: [WeatherModel] = []
    @Published var hasError: Bool = false
    @Published var errorMessage: String = ""
    private let apiKey = "46c9dce35b9dad8772236e5777f07347"
    let cities = ["New York", "London", "Tokyo", "Berlin", "Paris", "Sydney", "Moscow", "Rome", "Madrid", "Beijing"]

    @MainActor
    func fetchData(forCity cityName: String) async {
        let urlString = "https://api.openweathermap.org/data/2.5/weather?q=\(cityName)&appid=\(self.apiKey)&units=imperial"
        guard let url = URL(string: urlString) else {
            self.hasError = true
            self.errorMessage = "Invalid URL"
            return
        }

        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let decodedResponse = try JSONDecoder().decode(WeatherResponse.self, from: data)
            let newWeatherData = convertToWeatherModel(from: decodedResponse)
            DispatchQueue.main.async {
                self.weatherData.append(newWeatherData)
            }
            self.hasError = false
        } catch {
            DispatchQueue.main.async {
                self.hasError = true
                self.errorMessage = error.localizedDescription
            }
        }
    }

    private func convertToWeatherModel(from response: WeatherResponse) -> WeatherModel {
        return WeatherModel(
            cityName: response.name,
            temperature: response.main.temp,
            description: response.weather.first?.description ?? "No description",
            humidity: response.main.humidity,
            icon: response.weather.first?.icon ?? ""
        )
    }
    func loadWeatherForAllCities() {
        self.weatherData.removeAll()
        for city in cities {
                Task {
                    await fetchData(forCity: city)
                }
            }
        }
    }




