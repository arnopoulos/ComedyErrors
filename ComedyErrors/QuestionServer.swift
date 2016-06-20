//
//  QuestionServer.swift
//  ComedyErrors
//
//  Created by Andrew Arnopoulos on 6/14/16.
//  Copyright © 2016 Andrew Arnopoulos. All rights reserved.
//

import UIKit

class QuestionServer: NSObject {
    
    static let sharedInstance = QuestionServer()
    
    lazy private var questions: [CEQuestion] = {
        let fileManager = NSFileManager.defaultManager()
        let resourcePath = NSBundle.mainBundle().resourcePath!
        var questions = [CEQuestion]()
        do {
            for file in try fileManager.contentsOfDirectoryAtPath(resourcePath) {
                if file.lowercaseString.hasSuffix("question") {
                    questions += [QuestionParser.parse(file)]
                }
            }
        } catch {
            print("Couldn't handle error")
        }
        
       return questions
    }()
    
    var count: Int = 0
    
    func reset() {
        count = 0
    }
    
    func randomQuestion() -> CEQuestion {
        count += 1
        return self.questions[self.count-1]
    }
    
    func hasMoreQuestions() -> Bool {
        let limit = (self.questions.count < 20) ? self.questions.count : 20
        return count < limit
    }
    
    func getCharacter() -> CECharacter {
        let characters:[CECharacter] = self.questions.filter({$0.selectedAnswer?.character != nil}).map({ (question) in
            (question.selectedAnswer?.character)!
        })
        let characterCount = characters.reduce([CECharacter:Int]()) { (count, character) -> [CECharacter:Int] in
            var newCount = count
            if let characterCount = newCount[character] {
                newCount[character] = characterCount + 1
            } else {
                newCount[character] = 1
            }
            return newCount
        }
        
        let keys = characterCount.keys
        var maxCharacter = keys.first!
        for character in keys {
            if characterCount[character] > characterCount[maxCharacter] {
                maxCharacter = character
            }
        }
        return maxCharacter
    }
}
