//
//  CityForecastPresenter.swift
//  WeatherForecast
//
//  Created by Mohammed Saleh on 11/17/21.
//

import Foundation
import SwiftyJSON

class CityForecastPresenter: NSObject {
    
    func getCityForecast(cityID: Int, onSuccess: @escaping ([Forecast], String) -> Void, onFailure: @escaping (String?) -> Void ) -> Void
    {
        let url = URLManager().getCityForecastURL(cityID)
        
        ServiceManager.callAPI(url: url, method: .get, parameters: nil, custumHeaders: nil) { (error, response) in
            if response != nil
            {
                var forecastDays = [Forecast]()
                let cityName = response!["title"].stringValue
                
                for consolidatedWeather in response!["consolidated_weather"].arrayValue {
                    forecastDays.append(Forecast(parametersJson: consolidatedWeather.dictionaryValue))
                }
                print(forecastDays, forecastDays.count)
                onSuccess(forecastDays, cityName)
            }else {
                onFailure("An error occurred, please try again")
            }
        }
    }
    
}
