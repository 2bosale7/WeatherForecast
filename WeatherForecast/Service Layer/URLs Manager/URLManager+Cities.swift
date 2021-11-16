//
//  URLManager+Auth.swift
//  Mina
//
//  Created by Mohammed Saleh on 6/16/21.
//

import Foundation

enum Cities: Int {
    case Cairo = 1521894
    case Riyadh = 1939753
    case NY = 2459115
}

extension URLManager {
    
    func getCityForecastURL(_ city:Cities) -> String {
        return "\(getCurrentBaseUrl())/\(city.rawValue)"
    }
}
