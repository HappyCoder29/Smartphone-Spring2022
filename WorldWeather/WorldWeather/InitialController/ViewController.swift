//
//  ViewController.swift
//  WorldWeather
//
//  Created by Ashish Ashish on 4/5/22.
//

import UIKit
import CoreLocation

class ViewController: UIViewController {
    
    let cities = ["Current Location", "Seattle", "Portland", "London", "Delhi", "Shanghai"]
    
    var citiesModel: [CurrentWeatherModel]?
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tblView: UITableView!
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.desiredAccuracy = kCLLocationAccuracyThreeKilometers
        citiesModel = initializeCities()
        
    }
    
    func initializeCities() -> [CurrentWeatherModel]{
        let seattle = CurrentWeatherModel("Seattle", "2628285");
        let portland = CurrentWeatherModel("Portland", "2627656");
        let london = CurrentWeatherModel("London", "2532799");
        let delhi = CurrentWeatherModel("Delhi", "3588318");
        let shanghai = CurrentWeatherModel("Shanghai", "74833");

        var modelArr = [CurrentWeatherModel]()
        
        modelArr.append(seattle)
        modelArr.append(portland)
        modelArr.append(london)
        modelArr.append(delhi)
        modelArr.append(shanghai)

        return modelArr
    }
    
    
    @IBAction func getLocation(_ sender: Any) {
        locationManager.requestLocation()

    }
    
    func getLocationURL(_ lat : String, _ lng : String) -> String {
        let url = "\(locationAPIURL)\(apiKey)?q=\(lat),\(lng)"
        return url
        
    }
    
    func getCurrentWeatherURL(_ cityKey : String) -> String{
        let url = "\(currentWeatherURL)\(cityKey)?apikey=\(apiKey)"
        return url
    }
    

}

