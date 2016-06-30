//
//  CEThumbnail.swift
//  ComedyErrors
//
//  Created by Andrew Arnopoulos on 6/14/16.
//  Copyright © 2016 Andrew Arnopoulos. All rights reserved.
//

import UIKit

@IBDesignable class CEThumbnail: UIView {
    
    @IBOutlet var imageView: UIImageView?
    private var gradient: CALayer = {
        let gradient = CAGradientLayer()
        let base = UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.6).CGColor
        gradient.colors = [UIColor.clearColor().CGColor, base]
        return gradient
    }()
    @IBOutlet var label: UILabel?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.imageView?.layer.addSublayer(self.gradient)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.gradient.frame = self.imageView?.bounds ?? CGRect.zero
    }

}
