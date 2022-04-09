//
//  LocationManagerCode.swift
//  WorldWeather
//
//  Created by Ashish Ashish on 4/5/22.
//

import Foundation
import CoreLocation

extension ViewController : CLLocationManagerDelegate{
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        guard let location = locations.last else { return}
        
        let lat = location.coordinate.latitude
        let lng = location.coordinate.longitude
        
      
        let url = getLocationURL("\(lat)", "\(lng)")
        getLocationData(url)
        .done { loc in
            print(loc.key)
            print(loc.city)
            print(loc.state)
            print(loc.country)
            
            let currentURL = getCurrentWeatherURL("\(loc.key)")
            
            getCurrentWeather(currentURL).done { currentWeatherModel in
                currentWeatherModel.city = loc.city
                print(currentWeatherModel.WeatherText)
                print(currentWeatherModel.WeatherIcon)
                print(currentWeatherModel.IsDayTime)
                print(currentWeatherModel.Temperature)
                
            }
            .catch { error in
                print(error.localizedDescription)
            }
            
        }
        .catch { error in
            print(error.localizedDescription)
        }

        
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error.localizedDescription)
    }
    
    
}
