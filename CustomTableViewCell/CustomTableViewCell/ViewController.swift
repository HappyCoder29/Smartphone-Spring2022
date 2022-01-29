//
//  ViewController.swift
//  CustomTableViewCell
//
//  Created by Ashish Ashish on 1/28/22.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
 
    let images = ["Seattle1","Seattle2","Seattle3","Seattle4","Seattle5","Seattle6","Seattle7","Seattle8","Seattle9","Seattle10" ]
    
    let imageNames = ["Image 1", "Image 2","Image 3","Image 4","Image 5","Image 6","Image 7","Image 8","Image 9","Image 10"]
    
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as!TableViewCell
        cell.imgViewCell.image = UIImage(named: images[indexPath.row])
        cell.lblCell.text = imageNames[indexPath.row]
        
        return cell
    }
    


}

