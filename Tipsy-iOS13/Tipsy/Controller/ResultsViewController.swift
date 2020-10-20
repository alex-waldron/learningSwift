//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by Alex Waldron on 10/19/20.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    var costPerPerson: Float? 
    var split: Double?
    var tipPercent: Int?
    @IBOutlet weak var costPerPersonLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        costPerPersonLabel.text = "$\(String(format: "%.2f", costPerPerson ?? 0.0))"
        descriptionLabel.text = "Split between \(Int(split ?? 2.0)) people with \(tipPercent ?? 10)% tip."
        // Do any additional setup after loading the view.
    }
    
    @IBAction func recalcPressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
