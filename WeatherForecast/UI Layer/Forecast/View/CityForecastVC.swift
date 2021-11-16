//
//  CityForecastVC.swift
//  WeatherForecast
//
//  Created by Mohammed Saleh on 11/16/21.
//

import UIKit

class CityForecastVC: ParentViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        if UserDefaultService.sharedInstance.isFirstTimeUser {
            performSegue(withIdentifier: "toCitiesListVC", sender: nil)
        }
    }
    
}
