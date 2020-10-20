//
//  CalculatorBrain.swift
//  BMI Calculator
//
//  Created by Alex Waldron on 10/17/20.
//  Copyright © 2020 Angela Yu. All rights reserved.
//

import UIKit

struct CalculatorBrain{
    var bmi:BMI?

    mutating func calcBMI(height: Float, weight: Float){
        let heightm = height/3.281
        let weightkg = weight/2.205
        let bmiVal = weightkg / pow(heightm, 2)
        self.bmi = BMI(value: bmiVal)
    }
    
    func getBMI() -> String {
        
        return String(format: "%.1f", bmi?.value ?? 0.0)
    }
    func rawToFtInch(rawVal: Float) -> String {
        let remainder = rawVal - Float(Int(rawVal))
        let inches = Int(remainder * 12)
        return "\(Int(rawVal)) ft \(inches) inches"
    }
    func weightDisplay(rawWeightVal: Float) -> String{
        return "\(Int(rawWeightVal.rounded())) lbs"
    }
    func getAdvice() -> String{
        return bmi?.advice ?? "IDK what you should do"
    }
    func getColor() -> UIColor{
        return bmi?.color ?? UIColor.green
    }
}
