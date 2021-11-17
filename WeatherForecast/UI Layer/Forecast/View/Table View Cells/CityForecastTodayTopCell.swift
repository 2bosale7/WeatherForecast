//
//  CityForecastTodayTopCell.swift
//  WeatherForecast
//
//  Created by Mohammed Saleh on 11/17/21.
//

import UIKit

class CityForecastTodayTopCell: UITableViewCell {
    
    @IBOutlet weak var cityNameCardView: CardView!
    @IBOutlet weak var cityName: UIButton!
    @IBOutlet weak var weatherDate: UILabel!
    
    
    @IBOutlet weak var weatherStatusIcon: UIImageView!
    @IBOutlet weak var weatherStatusLbl: UILabel!
    
    @IBOutlet weak var max: UILabel!
    @IBOutlet weak var min: UILabel!
    @IBOutlet weak var mph: UILabel!
    
    @IBOutlet weak var humidityTitle: UILabel!
    @IBOutlet weak var humidityValue: UILabel!
    
    @IBOutlet weak var visibilityTitle: UILabel!
    @IBOutlet weak var visibilityValue: UILabel!
    
    @IBOutlet weak var pressureTitle: UILabel!
    @IBOutlet weak var pressureValue: UILabel!
    
    @IBOutlet weak var confidenceTitle: UILabel!
    @IBOutlet weak var confidenceValue: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        updateUI()
    }
    
    func configCell(forecast: Forecast, cityName:String) {
        self.cityName.setTitle(cityName, for: .normal)
        weatherStatusLbl.text = forecast.weather_state_name
        max.text = "Max: " + String(Int(forecast.max_temp)) + "º C"
        min.text = "Min: " + String(Int(forecast.min_temp)) + "º C"
        mph.text = String(Int(forecast.wind_speed)) + "mph"
        
        humidityValue.text = String(forecast.humidity) + "%"
        visibilityValue.text = String(format: "%.1f", forecast.visibility) + " miles"
        pressureValue.text = String(Int(forecast.air_pressure)) + "mb"
        confidenceValue.text = String(forecast.predictability) + "%"
        weatherDate.text = "Today"
        
        let strURL = URLManager().forecastIconsBaseURL + "\(forecast.weather_state_abbr!).png"
        if let imageURL = NSURL(string: strURL) {
            let imagedData = NSData(contentsOf: imageURL as URL)!
            weatherStatusIcon.image = UIImage(data: imagedData as Data)
        }
        
    }
    
    private func updateUI() {
        cityNameCardView.layer.borderWidth = 1
        cityNameCardView.layer.borderColor = UIColor.white.cgColor
        cityName.setTitleColor(.white, for: .normal)
        cityName.titleLabel?.font = AppFont().xLargeBoldSize
        weatherDate.font = AppFont().largeBoldSize
        weatherStatusLbl.font = AppFont().xLargeBoldSize
        
        max.font = AppFont().largeBoldSize
        min.font = AppFont().largeBoldSize
        mph.font = AppFont().largeBoldSize
        
        humidityTitle.font = AppFont().xLargeBoldSize
        humidityValue.font = AppFont().largeSize
        
        visibilityTitle.font = AppFont().xLargeBoldSize
        visibilityValue.font = AppFont().largeSize
        
        pressureTitle.font = AppFont().xLargeBoldSize
        pressureValue.font = AppFont().largeSize
        
        confidenceTitle.font = AppFont().xLargeBoldSize
        confidenceValue.font = AppFont().largeSize
        
    }
}
