//
//  TableViewController.swift
//  TableViewControllerExample
//
//  Created by Ashish Ashish on 1/28/22.
//

import UIKit

/*
 1. Remove View controller from storybaord and remove the code
 2. Add a TableViewController to the storyboard and add "cell" as reusable identifier
 3. Make the tableview as initial VC
 4. add TableViewController Code file and map UI and Code file
 5. remove boiler plate code and have 2 functions numberOfRowsInSection and cellForRowAt
 6. Add array and return arr.count in numberOfRowsInSection
 7. Return the cell (configure cell to use the array)
 
 */

class TableViewController: UITableViewController {

    let arr = ["Mark", "Bill", "Tom", "Peter", "John"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arr.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        // Configure the cell...
        cell.textLabel?.text = arr[indexPath.row]
        
        // Adding some comment
        
        return cell
    }
    

}
