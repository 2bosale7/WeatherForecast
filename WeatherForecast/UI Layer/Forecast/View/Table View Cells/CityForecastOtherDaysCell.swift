//
//  CityForecastOtherDaysCell.swift
//  WeatherForecast
//
//  Created by Mohammed Saleh on 11/17/21.
//

import UIKit

class CityForecastOtherDaysCell: UITableViewCell {

    @IBOutlet weak var weatherDate: UILabel!
    @IBOutlet weak var max: UILabel!
    @IBOutlet weak var min: UILabel!
    @IBOutlet weak var mph: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        updateUI()
    }
    
    func configCell(forecast: Forecast) {
        if let weatherDate = forecast.applicable_date.getDateFromString() {
            self.weatherDate.text = weatherDate.getFormattedDate(format: "EEEE, MMM d, yyyy")
        }else{
            self.weatherDate.text = forecast.applicable_date
        }
        
        max.text = "Max: " + String(Int(forecast.max_temp)) + "º C"
        min.text = "Min: " + String(Int(forecast.min_temp)) + "º C"
        mph.text = String(Int(forecast.wind_speed)) + "mph"
    }
    
    private func updateUI() {
        weatherDate.font = AppFont().largeBoldSize
        max.font = AppFont().largeSize
        min.font = AppFont().largeSize
        mph.font = AppFont().largeSize
    }

}
