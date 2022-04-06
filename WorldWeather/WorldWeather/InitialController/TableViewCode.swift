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
        guard let rows = citiesModel?.count else { return 1 }
        return rows + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
    
        if indexPath.row == 0 {
            cell.textLabel?.text = "Current Location"
        }else{
            cell.textLabel?.text = citiesModel![indexPath.row - 1].city
        }
        
        return cell
    }
    
    
    
}


