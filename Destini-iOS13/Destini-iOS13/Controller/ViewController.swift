//
//  ViewController.swift
//  Destini-iOS13
//
//  Created by Angela Yu on 08/08/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var storyLabel: UILabel!
    @IBOutlet weak var choice1Button: UIButton!
    @IBOutlet weak var choice2Button: UIButton!
    
    var brain = StoryBrain()
    
    @IBAction func answerPicked(_ sender: UIButton) {
        if sender.currentTitle == "Take a left"{
            updateUI(story: "tiger")
        }else if sender.currentTitle == "Take a right" {
            updateUI(story: "treasure")
        } else{
            endStory()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let firstStory = brain.stories["fork"]!
        storyLabel.text = firstStory.text
        choice1Button.setTitle(firstStory.choice1, for: .normal)
        choice2Button.setTitle(firstStory.choice2, for: .normal)
    }

    func updateUI(story: String){
        let newStory = brain.stories[story]!
        storyLabel.text = newStory.text
        choice1Button.setTitle(newStory.choice1, for: .normal)
        choice2Button.setTitle(newStory.choice2, for: .normal)
    }
    func endStory(){
        storyLabel.text = "Game over"
        choice1Button.setTitle("Good", for: .normal)
        choice2Button.setTitle("Game", for: .normal)    }
}

