//
//  URLManager+Auth.swift
//  Mina
//
//  Created by Mohammed Saleh on 6/16/21.
//

import Foundation

extension URLManager {
    
    func getCityForecastURL(_ id:Int) -> String {
        return "\(getCurrentBaseUrl())/\(id)"
    }
}
