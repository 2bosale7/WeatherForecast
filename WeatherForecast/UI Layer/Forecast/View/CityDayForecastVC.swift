//
//  CityDayForecastVC.swift
//  WeatherForecast
//
//  Created by Mohammed Saleh on 11/17/21.
//

import UIKit

class CityDayForecastVC: ParentViewController {

    @IBOutlet weak var weatherStatusIcon: UIImageView!
    @IBOutlet weak var weatherStatusLbl: UILabel!
    
    @IBOutlet weak var weatherDate: UILabel!

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

    
    var forecast: Forecast!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        updateUI()
        setForecastInfo()
    }
    
    
    private func setForecastInfo() {
        weatherStatusLbl.text = forecast.weather_state_name
        max.text = "Max: " + String(Int(forecast.max_temp)) + "º C"
        min.text = "Min: " + String(Int(forecast.min_temp)) + "º C"
        mph.text = String(Int(forecast.wind_speed)) + "mph"
        
        humidityValue.text = String(forecast.humidity) + "%"
        visibilityValue.text = String(format: "%.1f", forecast.visibility) + " miles"
        pressureValue.text = String(Int(forecast.air_pressure)) + "mb"
        confidenceValue.text = String(forecast.predictability) + "%"
        
        if let weatherDate = forecast.applicable_date.getDateFromString() {
            self.weatherDate.text = weatherDate.getFormattedDate(format: "EEEE, MMM d, yyyy")
        }else{
            self.weatherDate.text = forecast.applicable_date
        }
        
        let strURL = URLManager().forecastIconsBaseURL + "\(forecast.weather_state_abbr!).png"
        if let imageURL = NSURL(string: strURL) {
            let imagedData = NSData(contentsOf: imageURL as URL)!
            weatherStatusIcon.image = UIImage(data: imagedData as Data)
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let _ = touches.first {
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    private func updateUI() {
        weatherDate.font = AppFont().largeBoldSize
        weatherStatusLbl.font = AppFont().xLargeBoldSize
        
        max.font = AppFont().largeSize
        min.font = AppFont().largeSize
        mph.font = AppFont().largeSize
        
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
