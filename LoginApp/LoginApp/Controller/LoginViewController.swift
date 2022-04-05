//
//  ViewController.swift
//  LoginApp
//
//  Created by Ashish Ashish on 4/4/22.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {
    @IBOutlet weak var txtEmail: UITextField!
    
    @IBOutlet weak var txtPassword: UITextField!
    
    @IBOutlet weak var lblStatus: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lblStatus.isHidden = true
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let keychain = KeychainService().keyChain
        if keychain.get("uid") != nil {
            performSegue(withIdentifier: "segueDashboard", sender: self)
        }
    }
    func addKeychainAfterLogin(uid : String){
        let keyChain = KeychainService().keyChain
        keyChain.set(uid, forKey: "uid")
        
    }


    @IBAction func loginAction(_ sender: Any) {
        guard let email = txtEmail.text else {return}
        guard let password = txtPassword.text else {return}
        
        if email == "" || password == "" {
            lblStatus.text = "Please enter EMail and Password"
            lblStatus.isHidden = false
            return
        }
        
        if email.isEmail == false  {
            lblStatus.text = "Please enter Valid EMail"
            lblStatus.isHidden = false
            return
        }
        
        
//        if password.isPasswordValid == false {
//            lblStatus.text = "Please enter strong password"
//            lblStatus.isHidden = false
//            return
//        }
        
        
        
        
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] authResult, error in
            guard let strongSelf = self else { return }
            
            if error != nil {
                strongSelf.lblStatus.text = error?.localizedDescription
                strongSelf.lblStatus.isHidden = false
                return
            }
            // if we are here we have successfully logged in
            // clean out password
            strongSelf.txtPassword.text = ""
            
            strongSelf.addKeychainAfterLogin(uid: Auth.auth().currentUser!.uid)
            
            strongSelf.performSegue(withIdentifier: "segueDashboard", sender: strongSelf)
        }
        
    }
    
}

