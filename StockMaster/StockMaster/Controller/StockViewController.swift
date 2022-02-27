//
//  StockViewController.swift
//  StockMaster
//
//  Created by Ashish Ashish on 2/27/22.
//

import UIKit
import RealmSwift

class StockViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
       // print(Realm.Configuration.defaultConfiguration.fileURL?.path)
        
        loadStockValues()

    }
    

    @IBAction func addDBAction(_ sender: Any) {
        
        let stock = StockShort()
        stock.symbol = "AAPL"
        stock.price = 120.96
        stock.volume = 332607163
        
        do{
            let realm = try Realm()
            try realm.write({
                realm.add(stock, update: .modified)
            })
        }catch{
            print("Error in writing to db")
        }
    }
    
    func loadStockValues(){
        
        do{
            let realm = try Realm()
            let stocks = realm.objects(StockShort.self)
          
            for stock in stocks {
                print(stock.symbol)
            }
            
        }catch{
            print("Error in reading from Realm")
        }
        
    }
    
    func getTslaStock() -> StockShort{
        do{
            let realm = try Realm()
            let stocks = realm.objects(StockShort.self)
            
            print(stocks)
            
            for stock in stocks {
                print(stock.symbol)
                if stock.symbol == "TSLA"{
                    return stock
                }
            }
            
            
        }catch{
            print("Error in reading from Realm")
        }
        
        return StockShort()
    }
    
    
    func deleteStockFromDB( stock : StockShort){
        do {
            let realm = try Realm()
            try realm.write({
                realm.delete(stock)
            })
            
        }catch{
            print("Unable to delete from Realm DB")
        }
    }
    
    @IBAction func deleteTSLAStock(_ sender: Any) {
        
        let tsla = getTslaStock()
        deleteStockFromDB(stock: tsla)
        
    }
    
    func addStockToDB(symbol : String){
        let stock = StockShort()
        stock.symbol = symbol
        do{
            let realm = try Realm()
            try realm.write({
                realm.add(stock, update: .modified)
            })
        }catch{
            print("Error in writing to db")
        }
    }
    
    
    
    @IBAction func addStocksAction(_ sender: Any) {
        
        var txtField : UITextField?
        
        let alertController = UIAlertController(title: "Add Stock", message: "", preferredStyle: .alert)
        
        let OKButton = UIAlertAction(title: "OK", style: .default) { action in
            guard let symbol = txtField?.text else {
                return
            }
                    
            self.addStockToDB(symbol: symbol)
        }
        
        let cancelButton = UIAlertAction(title: "Cancel", style: .cancel) { action in
            
        }
        
        alertController.addAction(OKButton)
        alertController.addAction(cancelButton)
        
        alertController.addTextField { stockTextField in
            stockTextField.placeholder = "Type Stock Symbol"
            txtField = stockTextField
            
        }
        
        self.present(alertController, animated: true, completion: nil)

        
        
        
        
    }
    
    
    
}
