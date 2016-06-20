//
//  CEAnswer.swift
//  ComedyErrors
//
//  Created by Andrew Arnopoulos on 6/14/16.
//  Copyright © 2016 Andrew Arnopoulos. All rights reserved.
//

import UIKit

class CEAnswer: NSObject {
    let answer: String
    let character: CECharacter
    
    init(answer: String, character: CECharacter) {
        self.answer = answer
        self.character = character
    }
}
