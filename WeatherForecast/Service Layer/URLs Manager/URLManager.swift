//
//  URLManager.swift
//  Mina
//
//  Created by Mohammed Saleh on 4/16/21.
//

import Foundation
enum AppEnvironments {
    case development, testing, production
}

class URLManager {
    
    let apiAccessKey = "Authorization"
    let apiAccessKeyValue = "Bearer "
    let forecastIconsBaseURL = "https://www.metaweather.com/static/img/weather/png/64/"
    
    #if DEV
        let currentWorkingEnvironment: AppEnvironments = .development
    #elseif TEST
        let currentWorkingEnvironment: AppEnvironments = .testing
    #else
        let currentWorkingEnvironment: AppEnvironments = .production
    #endif
    
    
    
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
