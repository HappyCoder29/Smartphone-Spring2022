//
//  ViewController.swift
//  PromisesExample
//
//  Created by Ashish Ashish on 4/4/22.
//

import UIKit
import Alamofire
import SwiftyJSON
import SwiftSpinner
import PromiseKit
class ViewController: UIViewController {

    let urlShortQuote = "https://financialmodelingprep.com/api/v3/quote-short/FB?apikey="
    let apiKey = "0ae8565c4294fa80d71b17b3ed6aca19"
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func getData(_ sender: Any) {
        
        let url = urlShortQuote + apiKey
        getStockData(url)
        .done { quote in
            print(quote.price)
            print(quote.volume)
            print(quote.symbol)
        }
        .catch { error in
            print(error.localizedDescription)
        }
    }
    
    func getStockData(_ url : String) -> Promise<QuoteShort>{
        return Promise<QuoteShort> { seal -> Void in
            AF.request(url).responseJSON { response in
                if response.error != nil {
                    seal.reject(response.error!)
                }
                
                let stocks = JSON(response.data!).array
                guard let stock = stocks!.first else { return}
            
                let quote = QuoteShort()
                quote.symbol = stock["symbol"].stringValue
                quote.price = stock["price"].floatValue
                quote.volume = stock["volume"].intValue
                
                seal.fulfill(quote) // I am fulfilling the promise
                
            }// end of response
        }// end is return Promise
    }// end of function
    
    
}

