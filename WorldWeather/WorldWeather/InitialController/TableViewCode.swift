//
//  TableViewCode.swift
//  WorldWeather
//
//  Created by Ashish Ashish on 4/5/22.
//

import Foundation
import UIKit

extension ViewController : UITableViewDelegate, UITableViewDataSource{
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let rows = citiesModel?.count else { return 0 }
        return rows
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        let cell = Bundle.main.loadNibNamed("WeatherTableViewCell", owner: self, options: nil)?.first as! WeatherTableViewCell
        
        guard let cityModel = citiesModel?[indexPath.row] else {return cell}

        if indexPath.row == 0 {
            cell.lblCity.text = "Current Location"
        }else {
            cell.lblCity.text = cityModel.city
        }
        
        cell.cityKey = cityModel.cityKey
        cell.city = cityModel.city
        cell.sendWeatherDelegate = self
        
        return cell
    }
    
    
    
}


