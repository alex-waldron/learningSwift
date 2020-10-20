//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

var player: AVAudioPlayer?

class ViewController: UIViewController {
    
    @IBOutlet weak var topLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    let hardTime = 12
    let mediumTime = 7
    let softTime = 5
    let hardnessTimes = ["Soft": 3, "Hard": 7, "Medium": 4]
    var secondsLeft = 60
    var baseTime = 60
    var timer = Timer()
    @IBAction func hardnessSelected(_ sender: UIButton) {
        timer.invalidate()
        let hardness = sender.currentTitle!
        secondsLeft = hardnessTimes[hardness]!
        baseTime = secondsLeft
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(update), userInfo: nil, repeats: true)
       
    }
    func playSound() {
        guard let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3") else {return}
        
        do{
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)
            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)
            guard let player = player else {return}
            player.play()
            
        } catch let error {
        print(error.localizedDescription)
    }
        
        
    }
    @objc func update(){
        if secondsLeft > 0 {
            print("\(secondsLeft) seconds")
            let currentProg = 1.0 - Float(secondsLeft)/Float(baseTime)
            progressBar.progress = currentProg
            secondsLeft-=1
        } else{
            progressBar.progress = 1
            topLabel.text = "Done!"
            playSound()
            DispatchQueue.main.asyncAfter(deadline: .now() + 5.0) {self.topLabel.text = "How do you like your eggs"
            }
            self.timer.invalidate()
        }
    }
    
        
    
}
