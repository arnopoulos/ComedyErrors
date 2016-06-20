//
//  CharacterParser.swift
//  ComedyErrors
//
//  Created by Andrew Arnopoulos on 6/19/16.
//  Copyright © 2016 Andrew Arnopoulos. All rights reserved.
//

import UIKit

class CharacterParser {
    class func parse(path: String) -> CECharacter {
        let resourcePath = NSBundle.mainBundle().resourcePath! + "/"
        let absolutePath = resourcePath + path
        let data = NSData(contentsOfFile: absolutePath)
        let contents = String(data: data ?? NSData(), encoding: NSUTF8StringEncoding) ?? ""
        
        var name = ""
        var description = ""
        var imageData = NSData()
        
        let lines = contents.componentsSeparatedByCharactersInSet(NSCharacterSet.newlineCharacterSet())
        for line in lines {
            if line.lowercaseString.hasPrefix("name") {
                let components = line.characters.split(":").map(String.init)
                name = components[1]
                
            } else if line.lowercaseString.hasPrefix("description") {
                let components = line.characters.split(":").map(String.init)
                description = components[1]
            } else if line.lowercaseString.hasPrefix("image") {
                let components = line.characters.split(":").map(String.init)
                let image = UIImage(named: components[1]) ?? UIImage()
                imageData = UIImagePNGRepresentation(image) ?? NSData()
            }
        }
        
        if name == "" || description == "" || imageData == NSData() {
            fatalError(path)
        }
        
        return CECharacter(name: name, description: description, imageData: imageData)
    }
}