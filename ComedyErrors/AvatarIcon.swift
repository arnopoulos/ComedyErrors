//
//  AvatarIcon.swift
//  ComedyErrors
//
//  Created by Andrew Arnopoulos on 6/18/16.
//  Copyright © 2016 Andrew Arnopoulos. All rights reserved.
//

import UIKit

@IBDesignable class AvatarIcon: UIView {

    @IBInspectable var image: UIImage? {
        didSet {
            self.imageView.image = image
            self.setNeedsLayout()
        }
    }
    
    private let imageView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setup()
    }
    
    override func prepareForInterfaceBuilder() {
        self.setup()
    }
    
    func setup() {
        self.layer.masksToBounds = true
        self.clipsToBounds = true
        self.addSubview(self.imageView)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.imageView.frame = self.bounds
        self.layer.cornerRadius = self.bounds.width / 2
    }

}
