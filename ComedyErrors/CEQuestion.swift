//
//  CEQuestion.swift
//  ComedyErrors
//
//  Created by Andrew Arnopoulos on 6/14/16.
//  Copyright © 2016 Andrew Arnopoulos. All rights reserved.
//

import UIKit

class CEQuestion: NSObject {
    let question: String
    let answers: [CEAnswer]
    let imageData: NSData
    var selectedAnswer: CEAnswer?
    
    init(question: String, answers: [CEAnswer], imageData: NSData) {
        self.question = question
        self.answers = answers
        self.imageData = imageData
    }
}
