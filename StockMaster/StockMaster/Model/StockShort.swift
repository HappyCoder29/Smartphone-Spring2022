//
//  StockShort.swift
//  StockMaster
//
//  Created by Ashish Ashish on 2/27/22.
//

import Foundation
import RealmSwift


class StockShort : Object{
    @objc dynamic var symbol : String = ""
    @objc dynamic var price : Float = 0.0
    @objc dynamic var volume : Int = 0
    
    override static func primaryKey() -> String? {
        return "symbol"
    }
    
    
}
