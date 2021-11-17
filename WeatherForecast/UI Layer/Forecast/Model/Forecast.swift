//
//  Forecast.swift
//  WeatherForecast
//
//  Created by Mohammed Saleh on 11/17/21.
//

import Foundation
import SwiftyJSON

class Forecast:NSObject {
    var id:Int!
    var weather_state_name:String!
    var weather_state_abbr:String!
    var wind_direction_compass:String!
    var created:String!
    var applicable_date:String!
    var min_temp:Double!
    var max_temp:Double!
    var the_temp:Double!
    var wind_speed:Double!
    var wind_direction:Double!
    var air_pressure:Double!
    var humidity:Int!
    var visibility:Double!
    var predictability:Int!
    
    init(parametersJson: [String: JSON])
    {
        if let id = parametersJson["id"]?.intValue
        {
            self.id = id
        }
        
        if let weather_state_name = parametersJson["weather_state_name"]?.stringValue
        {
            self.weather_state_name = weather_state_name
        }
        
        if let weather_state_abbr = parametersJson["weather_state_abbr"]?.stringValue
        {
            self.weather_state_abbr = weather_state_abbr
        }
        
        if let wind_direction_compass = parametersJson["wind_direction_compass"]?.stringValue
        {
            self.wind_direction_compass = wind_direction_compass
        }
        
        if let created = parametersJson["created"]?.stringValue
        {
            self.created = created
        }
        
        if let applicable_date = parametersJson["applicable_date"]?.stringValue
        {
            self.applicable_date = applicable_date
        }
        
        if let min_temp = parametersJson["min_temp"]?.doubleValue
        {
            self.min_temp = min_temp
        }
        
        if let max_temp = parametersJson["max_temp"]?.doubleValue
        {
            self.max_temp = max_temp
        }
        
        if let the_temp = parametersJson["the_temp"]?.doubleValue
        {
            self.the_temp = the_temp
        }
        
        if let wind_speed = parametersJson["wind_speed"]?.doubleValue
        {
            self.wind_speed = wind_speed
        }
        
        if let wind_direction = parametersJson["wind_direction"]?.doubleValue
        {
            self.wind_direction = wind_direction
        }
        
        if let air_pressure = parametersJson["air_pressure"]?.doubleValue
        {
            self.air_pressure = air_pressure
        }
        
        if let humidity = parametersJson["humidity"]?.intValue
        {
            self.humidity = humidity
        }
        
        if let visibility = parametersJson["visibility"]?.doubleValue
        {
            self.visibility = visibility
        }
        
        if let predictability = parametersJson["predictability"]?.intValue
        {
            self.predictability = predictability
        }
        
    }
}
