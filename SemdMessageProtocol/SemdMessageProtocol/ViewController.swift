//
//  ViewController.swift
//  SemdMessageProtocol
//
//  Created by Ashish Ashish on 2/13/22.
//

import UIKit

class ViewController: UIViewController, SendMessageDelegate {
   
    

    @IBOutlet weak var lblWelcome: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func getMessageAction(_ sender: Any) {
        performSegue(withIdentifier: "segueSendMessage", sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueSendMessage" {
            let secondVC = segue.destination as! SendMessageViewController
            
           secondVC.sendMessageDelegate = self
            
        }
    }
    
    func sendMessage(message: String) {
        lblWelcome.text = message
    }
    

}

