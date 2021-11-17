//
//  ViewController.swift
//  WeatherForecast
//
//  Created by Mohammed Saleh on 11/16/21.
//

import UIKit

protocol ChangeCityDelegate: NSObject {
    func cityChanged()
}

class CitiesListVC: ParentViewController {
    
    @IBOutlet var containerView: UIView!
    @IBOutlet weak var screenTitle: UILabel!
    @IBOutlet weak var citiesTV: UITableView!
    
    weak var changeCityDelegate: ChangeCityDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        citiesTV.delegate = self
        citiesTV.dataSource = self
        
        updateUI()
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            if let touchedView = touch.view, touchedView == containerView {
                self.dismiss(animated: true, completion: nil)
            }
        }
    }
    
    private func updateUI() {
        screenTitle.font = AppFont().largeBoldSize
    }

}


extension CitiesListVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Cities.allCases.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CityCell", for: indexPath)
        cell.textLabel?.font = AppFont().largeSize
        cell.textLabel?.text = Cities.allCases[indexPath.row].rawValue
        
        return cell
    }
}

extension CitiesListVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cityID = Cities.allCases[indexPath.row].cityID
        UserDefaultService.sharedInstance.defaultCityID = cityID
        changeCityDelegate?.cityChanged()
        dismiss(animated: true, completion: nil)
    }
}
