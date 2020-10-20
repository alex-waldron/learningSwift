//
//  ResultViewController.swift
//  BMI Calculator
//
//  Created by Alex Waldron on 10/17/20.
//  Copyright © 2020 Angela Yu. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    
    var bmiValue: String?
    var advice: String?
    var color: UIColor?

    @IBOutlet weak var bmiLabel: UILabel!
    @IBOutlet weak var adviceLabel: UILabel!
    @IBOutlet var backgroundView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bmiLabel.text = bmiValue
        adviceLabel.text = advice
        backgroundView.backgroundColor = color
        
    }
    
    @IBAction func recalcPressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    

}
