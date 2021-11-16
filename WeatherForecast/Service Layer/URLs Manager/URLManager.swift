//
//  URLManager.swift
//  Mina
//
//  Created by Mohammed Saleh on 4/16/21.
//

import Foundation
enum AppEnvironments {
    case development, production
}

class URLManager {
    
    let apiAccessKey = "Authorization"
    let apiAccessKeyValue = "Bearer "
    
    private let currentWorkingEnvironment = AppEnvironments.production
    
    private var developmentServerBaseURL:String
    {
        return "https://www.metaweather.com/api/location"
    }
    
    private var ProducationServerBaseURL:String
    {
        return "https://www.metaweather.com/api/location"
    }
    
    func getCurrentBaseUrl() -> String{
        if currentWorkingEnvironment == .development {
            return developmentServerBaseURL
        }else{
            return ProducationServerBaseURL
        }
    }
}
