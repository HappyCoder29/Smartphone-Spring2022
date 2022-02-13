//
//  SecondViewController.swift
//  SegueExample
//
//  Created by Ashish Ashish on 2/6/22.
//

import UIKit

protocol SendDataBackDelegate {
    func sendData(str : String)
}

class SecondViewController: UIViewController {
    
    var sendDatabackDelegate : SendDataBackDelegate?
    
    @IBOutlet weak var lblWelcome: UILabel!
    var welcomeStr = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lblWelcome.text = welcomeStr

        // Do any additional setup after loading the view.
    }
    
    @IBAction func goBack(_ sender: Any) {
        
        sendDatabackDelegate?.sendData(str: "Ashish Singh")
        
        self.navigationController?.popViewController(animated: true)
        
    }
    
}
