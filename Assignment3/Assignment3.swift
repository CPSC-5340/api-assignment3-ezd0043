//
//  Assignment3.swift
//  Assignment3
//
//  Created by Emily Denham on 3/29/24.
//

import Foundation
import SwiftUI

@main
struct Assignment3: App {
    var body: some Scene {
        WindowGroup {
            WeatherView(viewModel: WeatherViewModel())
        }
    }
}
