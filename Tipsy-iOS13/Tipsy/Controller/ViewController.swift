//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var billBrain = BillBrain()
    
    @IBOutlet weak var zeroPercent: UIButton!
    @IBOutlet weak var tenPercent: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    @IBOutlet weak var twentyPercentButton: UIButton!
    @IBOutlet weak var billTotalInput: UITextField!
    
    
    @IBAction func twentyPercentButton(_ sender: UIButton) {
        billBrain.tipPercent = 0.2
        self.selectButton(select: sender, unselect: [tenPercent, zeroPercent])
        
    }
    
    @IBAction func tenPercentButton(_ sender: UIButton) {
        billBrain.tipPercent = 0.1
        self.selectButton(select: sender, unselect: [zeroPercent, twentyPercentButton])

    }
    
    @IBAction func zeroPercentButton(_ sender: UIButton) {
        billBrain.tipPercent = 0.0
        self.selectButton(select: sender, unselect: [tenPercent, twentyPercentButton])

    }
    
    
    @IBAction func splitStepper(_ sender: UIStepper) {
        billBrain.split = sender.value
        splitNumberLabel.text = String(format: "%.0f", sender.value)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func calcPressed(_ sender: UIButton) {
        billBrain.billTotal = billTotalInput.text
        print(billBrain.billTotal!)
        self.performSegue(withIdentifier: "calculateSegue", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "calculateSegue"{
            let destinationVC = segue.destination as! ResultsViewController
            destinationVC.costPerPerson = billBrain.getPricePerPerson()
            destinationVC.tipPercent = Int(billBrain.tipPercent! * 100)
            destinationVC.split = billBrain.split
        }
    }
    
    func selectButton(select:UIButton, unselect: [UIButton]){
        select.isSelected = true
        for button in unselect{
            button.isSelected = false
        }
    }

}

