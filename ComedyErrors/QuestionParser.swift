//
//  QuestionParser.swift
//  ComedyErrors
//
//  Created by Andrew Arnopoulos on 6/19/16.
//  Copyright © 2016 Andrew Arnopoulos. All rights reserved.
//

import UIKit

class QuestionParser {
    class func parse(path: String) -> CEQuestion {
        let resourcePath = NSBundle.mainBundle().resourcePath! + "/"
        let absolutePath = resourcePath + path
        let data = NSData(contentsOfFile: absolutePath)
        let contents = String(data: data ?? NSData(), encoding: NSUTF8StringEncoding) ?? ""
        
        var imageData = NSData()
        var question = ""
        var answers = [CEAnswer]()
        
        let lines = contents.componentsSeparatedByCharactersInSet(NSCharacterSet.newlineCharacterSet())
        
        for line in lines {
            if line.lowercaseString.hasPrefix("answer") {
                let components = line.characters.split(":").map(String.init)
                let answer = AnswerParser.parse(components[1])
                answers += [answer]
            } else if line.lowercaseString.hasPrefix("question") {
                let components = line.characters.split(":").map(String.init)
                question = components[1]
            } else if line.lowercaseString.hasPrefix("image") {
                let components = line.characters.split(":").map(String.init)
                let image = UIImage(named: components[1]) ?? UIImage()
                imageData = UIImagePNGRepresentation(image) ?? NSData()
            }
        }
        
        return CEQuestion(question: question, answers: answers, imageData: imageData)
    }
}
