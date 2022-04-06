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
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tblView: UITableView!
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.desiredAccuracy = kCLLocationAccuracyThreeKilometers
        
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

