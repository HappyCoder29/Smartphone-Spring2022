//
//  KeychainService.swift
//  LoginApp
//
//  Created by Ashish Ashish on 4/5/22.
//

import Foundation
import KeychainSwift

class KeychainService {
    
    var _keyChain = KeychainSwift()
    
    var keyChain : KeychainSwift {
        
        get {
           return _keyChain
        }
        
        set {
           _keyChain = newValue
        }
        
    }
    
    
}

