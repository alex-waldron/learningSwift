//
//  BMI.swift
//  BMI Calculator
//
//  Created by Alex Waldron on 10/19/20.
//  Copyright © 2020 Angela Yu. All rights reserved.
//

import UIKit

struct BMI {
    var value: Float
    var advice: String
    var color: UIColor
    init (value:Float) {
        self.value = value
        if value > 24.9 {
            self.advice = "Stop eating so much"
            self.color = #colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1)
        } else if value < 18.5 {
            self.advice = "grab a burger bro"
            self.color = #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)
        } else {
            self.advice = "keep it up"
            self.color = #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
        }
    }
}
