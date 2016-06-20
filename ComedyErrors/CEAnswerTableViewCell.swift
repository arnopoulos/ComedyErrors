//
//  CEAnswerTableViewCell.swift
//  ComedyErrors
//
//  Created by Andrew Arnopoulos on 6/14/16.
//  Copyright © 2016 Andrew Arnopoulos. All rights reserved.
//

import UIKit

@IBDesignable class CEAnswerTableViewCell: UITableViewCell {
    
    @IBOutlet var checkmark: UIImageView?
    @IBOutlet var questionLabel: UILabel?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        self.checkmark?.hidden = !selected
        // Configure the view for the selected state
    }
    
//    override func intrinsicContentSize() -> CGSize {
//        var size = super.intrinsicContentSize()
//        size.height = self.textLabel?.intrinsicContentSize().height ?? size.height
//        return size
//    }

}
