//
//  ViewController.swift
//  FoodImages
//
//  Created by Ashish Ashish on 1/28/22.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let images = ["Seattle1", "Seattle2"]
    let foodNames = ["Pad Thai", "Salad"]

    
    @IBOutlet weak var tblView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tblView.delegate = self
        tblView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return images.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        
        cell.imgViewCell.image = UIImage(named: images[indexPath.row])
        cell.lblCell.text = foodNames[indexPath.row]

        
        return cell
    }


}

