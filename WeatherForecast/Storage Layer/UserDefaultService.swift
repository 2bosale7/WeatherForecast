//
//  UserDefaultService.swift
//  WeatherForecast
//
//  Created by Mohammed Saleh on 11/16/21.
//

import Foundation

class UserDefaultService {
    static var sharedInstance = UserDefaultService()
    let defualts = UserDefaults.standard
    
    var isFirstTimeUser: Bool {
        if let _ = self.defaultCityID {
            return false
        }else{
            return true
        }
    }
    
    var defaultCityID: Int? {
        get{
            defualts.value(forKey: "cityID") as? Int
        }
        set{
            defualts.set(newValue, forKey: "cityID")
        }
    }
    
}
