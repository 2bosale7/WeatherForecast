//
//  ForecastCities.swift
//  WeatherForecast
//
//  Created by Mohammed Saleh on 11/16/21.
//

import Foundation


enum Cities: String, CaseIterable {
    case cairo = "Cairo"
    case riyadh = "Riyadh"
    case newYork = "New York"
    
    var cityID: Int {
        switch self {
            case .cairo:
                return 1521894
            case .riyadh:
                return 1939753
            case .newYork:
                return 2459115
        }
    }
}
