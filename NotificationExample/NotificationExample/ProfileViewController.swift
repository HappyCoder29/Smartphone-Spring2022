//
//  ProfileViewController.swift
//  NotificationExample
//
//  Created by Ashish Ashish on 2/13/22.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet weak var txtFirstName: UITextField!
    @IBOutlet weak var txtLastName: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func saveName(_ sender: Any) {
        
        guard let firstName = txtFirstName.text else {return}
        guard let lastName = txtLastName.text else {return}

        
        let firstAndLastName: [String: String] = [
                                                    "FirstName" : firstName,
                                                    "LastName" : lastName
                                                ]
        
        NotificationCenter.default.post(name: nameNotif, object: nil, userInfo: firstAndLastName)
        
        self.navigationController?.popViewController(animated: true)
        
    }
    

}
