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
    }
    
    private func updateUI() {
        cityNameCardView.layer.borderWidth = 1
        cityNameCardView.layer.borderColor = UIColor.white.cgColor
        cityName.setTitleColor(.white, for: .normal)
        cityName.titleLabel?.font = AppFont().largeBoldSize
        
        weatherStatusLbl.font = AppFont().largeSize
        
        max.font = AppFont().normalSize
        min.font = AppFont().normalSize
        mph.font = AppFont().normalSize
        
        humidityTitle.font = AppFont().normalBoldSize
        humidityValue.font = AppFont().normalSize
        
        visibilityTitle.font = AppFont().normalBoldSize
        visibilityValue.font = AppFont().normalSize
        
        pressureTitle.font = AppFont().normalBoldSize
        pressureValue.font = AppFont().normalSize
        
        confidenceTitle.font = AppFont().normalBoldSize
        confidenceValue.font = AppFont().normalSize
        
    }
}
