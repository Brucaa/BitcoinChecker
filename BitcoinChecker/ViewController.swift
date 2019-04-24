//
//  ViewController.swift
//  BitcoinChecker
//
//  Created by Milos Jovanovic on 10/04/2019.
//  Copyright © 2019 Milos Jovanovic. All rights reserved.
//

import UIKit
import SwiftyJSON
import Alamofire

class ViewController: UIViewController {

 
    
    @IBOutlet weak var bitcoinPriceLabel: UILabel!
    @IBOutlet weak var currencyPicker: UIPickerView!
 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        currencyPicker.delegate = self
        currencyPicker.dataSource = self
    }


//    //MARK: - Networking
//    /***************************************************************/
    
    
    
        func getBitcoinData(url: String) {
    
            Alamofire.request(url, method: .get)
                .responseJSON { response in
                    if response.result.isSuccess {
    
                        print("Got data!")
                        let bitcoinJSON : JSON = JSON(response.result.value!)
    
                        self.updateBitcoinData(json: bitcoinJSON)
    
                    } else {
                        print("Error: \(String(describing: response.result.error))")
                        self.bitcoinPriceLabel.text = "Connection Issues"
                    }
                }
    
        }
    
    
    
    
    
    
//    //MARK: - JSON Parsing
//    /***************************************************************/
    
    
    
        func updateBitcoinData(json : JSON) {
    
            if let bitcoinValue = json["ask"].double {
                bitcoinPriceLabel.text = currencySelected + String(bitcoinValue)
            }
    
            else {
                bitcoinPriceLabel.text = "Price unavailable"
            }
        }
    
}

//    //MARK: - PickerView
//    /***************************************************************/

extension ViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return currencyArray.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return currencyArray[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        print(currencyArray[row])
        
        finalURL = baseURL + currencyArray[row]
        print(finalURL)
        currencySelected = symbolArray[row]
        getBitcoinData(url: finalURL)
    }
    
}


