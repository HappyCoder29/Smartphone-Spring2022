//
//  ViewController.swift
//  GetLocation
//
//  Created by Ashish Ashish on 4/4/22.
//

import UIKit
import CoreLocation

/*
 
 1. Create Privacy Location entries in Info.plist for Always and when in use
 2. Import CoreLocation library
 3. Create Outlets and add CLLocationManageDelegate in the class
 4. create a Location manager instance let locationManager = CLLocationManager()
 5. In the viewdidload set delegate, request usage and accuracy
 6. Add didUpdateLocations function for locationManager this function will be called when any location amd write the didFailWithError function
 change happens or request is made for location
 7. When you want to getr location just once you will add that in a button and add call locationManager.requestLocation()
 This will get the location one time
 8. When you want to get location change in the background and want to monitor changes you will make the following code
 if CLLocationManager.significantLocationChangeMonitoringAvailable(){
     locationManager.startMonitoringSignificantLocationChanges()
     locationManager.startUpdatingLocation()
 }
 
 
 */


class ViewController: UIViewController, CLLocationManagerDelegate {

    @IBOutlet weak var lblLatitude: UILabel!
    @IBOutlet weak var lblLongitude: UILabel!
    @IBOutlet weak var lblAddress: UILabel!
    
    let locationManager = CLLocationManager()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters
        startSignificantLocationChange()
        
    }

    @IBAction func getLocation(_ sender: Any) {
        locationManager.requestLocation()

    }
    
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Error in getting location \(error.localizedDescription)")
    }
    
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        
        let lat = location.coordinate.latitude
        let lng = location.coordinate.longitude
        
        print(lat)
        print(lng)
        
        lblLatitude.text = "Latitude: \(lat)"
        lblLongitude.text = "Longitude: \(lng)"
        
        getAddress(location: location)
        
    }
    
    func startSignificantLocationChange(){
        
        if CLLocationManager.significantLocationChangeMonitoringAvailable(){
            locationManager.startMonitoringSignificantLocationChanges()
            locationManager.startUpdatingLocation()
        }
        
    }
    
    func getAddress( location : CLLocation){
        
        let clGeocoder = CLGeocoder()
        
        clGeocoder.reverseGeocodeLocation(location) { placeMarks, error in
            if error != nil {
                self.lblAddress.text = "Unable to get Address"
                return
            }
            
            guard let place = placeMarks?[0] else {return }
            
            var address = ""
            if place.name != nil {
                address += place.name! + ", "
            }
            if place.locality != nil {
                address += place.locality! + ", "
            }
            
            if place.subLocality != nil {
                address += place.subLocality! + ", "
            }
            
            if place.postalCode  != nil {
                address += place.postalCode! + ", "
            }
            
            if place.country  != nil {
                address += place.country! + ", "
            }
            if place.region  != nil {
                print("Region: \(place.region!)" )
            }
            
            if place.areasOfInterest  != nil {
                print("Region: \(place.areasOfInterest!)" )
            }
            
            print(address)
            self.lblAddress.text = address
        
        }
        
    }
    
}

