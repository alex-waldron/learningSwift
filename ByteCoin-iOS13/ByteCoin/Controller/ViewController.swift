//
//  ViewController.swift
//  ByteCoin
//
//  Created by Angela Yu on 11/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
// API KEY: 261EB0F0-A611-4C92-8458-BF20FDE9A973

import UIKit

class ViewController: UIViewController{
    var coinManager = CoinManager()
    @IBOutlet weak var bitcoinLabel: UILabel!
    @IBOutlet weak var currencyLabel: UILabel!
    @IBOutlet weak var currencyPicker: UIPickerView!
    override func viewDidLoad() {
        super.viewDidLoad()
        currencyPicker.dataSource = self
        currencyPicker.delegate = self
        coinManager.delegate = self
        // Do any additional setup after loading the view.
    }
}

//MARK: - UIPicker
extension ViewController:  UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return coinManager.currencyArray.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return coinManager.currencyArray[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let currency = coinManager.currencyArray[row]
        print("attempting to get bitcoin value of \(currency) currency")
        coinManager.getCoinPrice(for: currency)
    }
}

//MARK: - CoinManagerDelegate

extension ViewController: CoinManagerDelegate{
    func updateCoinValue(_ coinManger: CoinManager, rate: Double) {
        DispatchQueue.main.async {
            print("the rate is \(rate)")
            self.bitcoinLabel.text = String(format: "%.2f", rate)
        }
        
    }
    
    func failedUpdateCoinValue(error: Error) {
        print(error)
    }
    
    
}

