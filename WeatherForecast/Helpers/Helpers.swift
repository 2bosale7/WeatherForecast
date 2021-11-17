//
//  Helpers.swift
//  WeatherForecast
//
//  Created by Mohammed Saleh on 11/16/21.
//

import Foundation

func getLocalCountryName() -> (String?, String?) {
    let countryLocale = Locale.current
    let countryCode = countryLocale.regionCode
    let country = (countryLocale as NSLocale).displayName(forKey: NSLocale.Key.countryCode, value: countryCode ?? "")
    print(countryCode ?? "", country ?? "")
    return (country: country, code: countryCode)
}

extension Date {
    func getFormattedDate(format: String) -> String {
        let dateformat = DateFormatter()
        dateformat.dateFormat = format
        return dateformat.string(from: self)
    }
}

extension String {
    func getDateFromString(format:String =  "yyyy-MM-dd") -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.dateFormat = format
        if let date = dateFormatter.date(from: self) {
            return date
        }else{
            return nil
        }
    }
    
    func addingPercentEncoding() -> String {
        if URL(string: self) != nil {
            return self
        }else{
            return self.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? self
        }
        
    }
}
