//
//  ProtocolSendWeatherData.swift
//  WorldWeather
//
//  Created by Ashish Ashish on 4/8/22.
//

import Foundation

protocol SendWeatherDelegate {
    func sendWeatherData(_ currentWeatherModel : CurrentWeatherModel)
}
