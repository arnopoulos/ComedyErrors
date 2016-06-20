//
//  CEButton.swift
//  ComedyErrors
//
//  Created by Andrew Arnopoulos on 6/14/16.
//  Copyright © 2016 Andrew Arnopoulos. All rights reserved.
//

import UIKit

@IBDesignable class CEButton: UIButton {
    
    @IBInspectable var cornerRadius: CGFloat = 0.0 {
        didSet {
            self.layer.cornerRadius = self.cornerRadius
        }
    }

    override func awakeFromNib() {
        self.layer.cornerRadius = self.cornerRadius
    }
    
    override func intrinsicContentSize() -> CGSize {
        let size = super.intrinsicContentSize()
        return CGSize(width: size.width + 15, height: size.height + 10)
    }

}
