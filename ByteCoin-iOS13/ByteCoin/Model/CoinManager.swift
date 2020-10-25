//
//  CoinManager.swift
//  ByteCoin
//
//  Created by Angela Yu on 11/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import Foundation
protocol CoinManagerDelegate {
    func updateCoinValue(_ coinManger: CoinManager, rate:Double)
    func failedUpdateCoinValue(error: Error)
}
struct CoinManager {
    
    let baseURL = "https://rest.coinapi.io/v1/exchangerate/BTC"
    let apiKey = "261EB0F0-A611-4C92-8458-BF20FDE9A973"
    var delegate: CoinManagerDelegate?
    
    let currencyArray = ["AUD", "BRL","CAD","CNY","EUR","GBP","HKD","IDR","ILS","INR","JPY","MXN","NOK","NZD","PLN","RON","RUB","SEK","SGD","USD","ZAR"]

    func getCoinPrice(for currency: String){
        let urlString = "\(baseURL)/\(currency)?apikey=\(apiKey)"
        print(urlString)
        if let url = URL(string: urlString){
            
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) {(data, response, error) in
                if error != nil {
                    self.delegate?.failedUpdateCoinValue(error: error!)
                    print(error!)
                } else{
                    print("error is nil")
                }
                if let safeData = data {
                    if let coinRate = self.parseJSON(safeData){
                        print(coinRate)
                        self.delegate?.updateCoinValue(self, rate: coinRate)
                    }
                }
            }
            task.resume()
            
 
        }
    }
    func parseJSON(_ dataToParse: Data) -> Double?{
            //add decoder here
            let decoder = JSONDecoder()
            do{
                let decodedData = try decoder.decode(CoinAPIModel.self, from: dataToParse)
                let rate = decodedData.rate
                let rateObject = CoinAPIModel(rate: rate)
                return rateObject.rate
                
            } catch{
                print("unable to read weather data")
                print(error)
                delegate?.failedUpdateCoinValue(error: error)
                return nil
            }
    
    }
}
