//
//  WeatherTableViewCell.swift
//  WorldWeather
//
//  Created by Ashish Ashish on 4/8/22.
//

import UIKit

class WeatherTableViewCell: UITableViewCell {

    @IBOutlet weak var lblCity: UILabel!
    
    var cityKey = ""
    var city = ""
    
    var sendWeatherDelegate : SendWeatherDelegate?
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    @IBAction func getWeatherAction(_ sender: Any) {
        
        let currentURL = getCurrentWeatherURL(cityKey)
        
        getCurrentWeather(currentURL).done { currentWeatherModel in
            currentWeatherModel.city = self.city
            self.sendWeatherDelegate?.sendWeatherData(currentWeatherModel)
            
        }
        .catch { error in
            print(error.localizedDescription)
        }
    }
    
}
