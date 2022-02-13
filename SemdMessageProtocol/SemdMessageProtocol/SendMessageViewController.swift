//
//  SendMessageViewController.swift
//  SemdMessageProtocol
//
//  Created by Ashish Ashish on 2/13/22.
//

import UIKit

class SendMessageViewController: UIViewController {

    @IBOutlet weak var txtMessage: UITextField!
    var sendMessageDelegate : SendMessageDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func sendMessageAction(_ sender: Any) {
        
        // I want to call the function in the VC who called me
        sendMessageDelegate?.sendMessage(message: txtMessage.text!)
        
        self.navigationController?.popViewController(animated: true)
    }
    

}
