//
//  AnswerParser.swift
//  ComedyErrors
//
//  Created by Andrew Arnopoulos on 6/19/16.
//  Copyright © 2016 Andrew Arnopoulos. All rights reserved.
//

import Foundation

class AnswerParser {
    class func parse(answer: String) -> CEAnswer {
        let components = answer.characters.split {
            $0 == "(" || $0 == ")"
        }.map(String.init)
        let character = CharacterParser.parse(components[1])
        return CEAnswer(answer: components[0], character: character)
    }
}