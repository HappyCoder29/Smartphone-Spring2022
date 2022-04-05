//
//  ViewController.swift
//  SearchBarExample
//
//  Created by Ashish Ashish on 4/4/22.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource , UISearchBarDelegate {
    
    
    @IBOutlet weak var tblView: UITableView!
    
    var namesArray = ["Ashish", "Ashley", "Amanda", "Mark", "Mike","Marissa", "Mary"]
    var copyArray = ["Ashish", "Ashley", "Amanda", "Mark", "Mike","Marissa", "Mary"]

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return namesArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = namesArray[indexPath.row]
        
        return cell
    }
    
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        //print(searchText)
        
        if searchBar.text!.isEmpty  == true {
            namesArray = copyArray
            tblView.reloadData()
            return
        }
        
        namesArray = copyArray.filter({ name in
            name.lowercased().contains(searchBar.text!.lowercased())
        })
        
        tblView.reloadData()
        
        
    }


}

