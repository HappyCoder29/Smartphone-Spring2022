//
//  ViewController.swift
//  SegueExample
//
//  Created by Ashish Ashish on 2/6/22.
//

import UIKit

class ViewController: UIViewController, SendDataBackDelegate {
   
    

    @IBOutlet weak var txtFirstName: UITextField!
    
    @IBOutlet weak var txtLastName: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

  
    @IBAction func goToSecondVC(_ sender: Any) {
        performSegue(withIdentifier: "segueToSecondVC", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "segueToSecondVC" {
            
            let secondVC = segue.destination as! SecondViewController
            
            secondVC.welcomeStr = "Welcome \(txtFirstName.text!), \(txtLastName.text!)"
            secondVC.sendDatabackDelegate = self
            
        }
        
    }
    
    func sendData(str: String) {
        txtFirstName.text = str
    }
}

