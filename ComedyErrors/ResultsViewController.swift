//
//  ResultsViewController.swift
//  ComedyErrors
//
//  Created by Andrew Arnopoulos on 6/18/16.
//  Copyright © 2016 Andrew Arnopoulos. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {

    var character: CECharacter? = nil {
        didSet {
            setupView()
        }
    }
    
    @IBOutlet var icon: AvatarIcon?
    
    @IBOutlet var nameLabel: UILabel?
    @IBOutlet var descriptionLabel: UITextView?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.hidesBackButton = true
        self.setupView()
    }
    
    func setupView() {
        self.nameLabel?.text = character?.name
        self.title = character?.name
        self.descriptionLabel?.text = character?.description
        self.icon?.image = UIImage(data: character?.imageData ?? NSData())
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.descriptionLabel?.contentOffset = CGPoint.zero
    }

}
