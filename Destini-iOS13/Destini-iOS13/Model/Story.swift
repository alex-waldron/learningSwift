//
//  Sotry.swift
//  Destini-iOS13
//
//  Created by Angela Yu on 08/08/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import Foundation

struct Story {
    let text: String
    let choice1: String
    let choice2: String
    
    init(text: String, choice1: String, choice2: String) {
        self.text = text
        self.choice1 = choice1
        self.choice2 = choice2
    }
}
