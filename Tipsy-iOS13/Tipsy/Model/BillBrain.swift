//
//  Bill.swift
//  Tipsy
//
//  Created by Alex Waldron on 10/19/20.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import Foundation

struct BillBrain {
    var billTotal: String? = nil
    var tipPercent: Float? = 0.1
    var split: Double? = 2
    
    func getPricePerPerson() -> Float {
        let multiplier: Float = 1.0 + (tipPercent ?? 0.0)
        let billTotalFl: Float = Float(billTotal ?? "0.0") ?? 0.0
        
        return (multiplier*billTotalFl)/Float(split!)
    }

}
