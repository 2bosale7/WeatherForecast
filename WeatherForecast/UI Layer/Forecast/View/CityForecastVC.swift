//
//  CityForecastVC.swift
//  WeatherForecast
//
//  Created by Mohammed Saleh on 11/16/21.
//

import UIKit

class CityForecastVC: ParentViewController {

    @IBOutlet weak var cityDaysForecastTV: UITableView!
    
    let presenter = CityForecastPresenter()
    var cityForecast = [Forecast]()
    var cityName:String!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        cityDaysForecastTV.delegate = self
        cityDaysForecastTV.dataSource = self
        cityDaysForecastTV.tableFooterView = UIView()
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.checkInternetStatus(notification:)), name: Notification.Name("notifyIntetnetStatus"), object: nil)
        
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        if UserDefaultService.sharedInstance.isFirstTimeUser {
            performSegue(withIdentifier: "toCitiesListVC", sender: self)
        }else{
            getCityWeatherForecast()
        }
    }
    
    func getCityWeatherForecast() {
        if isNetworkReachable {
            self.showLoader()
            presenter.getCityForecast(cityID: UserDefaultService.sharedInstance.defaultCityID ?? 0) { (forecast, cityName) in
                self.cityForecast = forecast
                self.cityName = cityName
                self.cityDaysForecastTV.reloadData()
                self.showErrorEmptyStateMessage(message: nil)
                self.hideLoader()
            } onFailure: { (error) in
                self.showErrorEmptyStateMessage(message: error)
                self.hideLoader()
            }
        }else{
            self.showNotInternetEmptyStateMessage()
        }
        

    }
    
    @IBAction func changeCity(_ sender: UIButton) {
        performSegue(withIdentifier: "toCitiesListVC", sender: self)
    }
    
    
    @objc func checkInternetStatus(notification: Notification) {
        let isConeected = notification.object as? Bool ?? false
        if isConeected {
            getCityWeatherForecast()
        }else{
            self.showAlert(title: "No internet connection", message: "", shouldpop: false)
        }
    }
    
    func showErrorEmptyStateMessage(message:String?) {
        self.emptyState(emptyStateMessage: message ?? "Sorry, something went wrong", emptyStateImageName: "exclamationmark.triangle", emptyStateButtonText: "Try again!", containerView: self.cityDaysForecastTV, buttonAction: self.reloadScreen).reloadState()
    }
    
    func showNotInternetEmptyStateMessage() {
        self.emptyState(emptyStateMessage:"No internet connection", emptyStateImageName: "wifi.slash", emptyStateButtonText: "Try again!", containerView: self.cityDaysForecastTV, buttonAction: self.reloadScreen).reloadState()
    }
    
    func reloadScreen (button:UIButton) {
        getCityWeatherForecast()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toCitiesListVC" {
            let dest = segue.destination as! CitiesListVC
            dest.changeCityDelegate = self
        }
    }
    
}

extension CityForecastVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cityForecast.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "CityForecastTodayTopCell", for: indexPath) as! CityForecastTodayTopCell
            cell.configCell(forecast: cityForecast[indexPath.row], cityName: cityName)
            return cell
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "CityForecastOtherDaysCell", for: indexPath) as! CityForecastOtherDaysCell
            cell.configCell(forecast: cityForecast[indexPath.row])
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 420
        }else{
            return 100
        }
        
    }
}

extension CityForecastVC: UITableViewDataSource {
    
}

extension CityForecastVC: ChangeCityDelegate {
    func cityChanged() {
        getCityWeatherForecast()
    }
}
