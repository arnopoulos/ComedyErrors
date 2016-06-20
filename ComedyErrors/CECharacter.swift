//
//  CECharacter.swift
//  ComedyErrors
//
//  Created by Andrew Arnopoulos on 6/14/16.
//  Copyright © 2016 Andrew Arnopoulos. All rights reserved.
//

import Foundation

class CECharacter: Hashable, Equatable {
    let name: String
    let description: String
    let imageData: NSData
    
    init(name: String, description: String, imageData: NSData) {
        self.name = name
        self.description = description
        self.imageData = imageData
    }
    
    lazy var hashValue: Int = {
       return self.name.hashValue
    }()
}

func ==(lhs: CECharacter, rhs: CECharacter) -> Bool {
    return lhs.hashValue == rhs.hashValue
}
