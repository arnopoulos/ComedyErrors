//
//  QuestionViewController.swift
//  ComedyErrors
//
//  Created by Andrew Arnopoulos on 6/14/16.
//  Copyright © 2016 Andrew Arnopoulos. All rights reserved.
//

import UIKit

class QuestionViewController: UIViewController {
    
    @IBOutlet private var tableView: UITableView?
    @IBOutlet private var thumbnail: CEThumbnail?
    
    @IBOutlet private var nextButton: UIBarButtonItem?
    
    @IBOutlet private var thumbnailAspectRatio: NSLayoutConstraint? {
        didSet {
            if let oldValue = oldValue {
                self.thumbnail?.removeConstraint(oldValue)
            }
            if let thumbnailAspectRatio = thumbnailAspectRatio {
                self.thumbnail?.addConstraint(thumbnailAspectRatio)
            }
        }
    }
    
    private var index: Int? = nil
    
    private var question: CEQuestion? {
        didSet {
            setupView()
        }
    }
    
    private func setupView() {
        let image = UIImage(data: self.question?.imageData ?? NSData())
        
        self.thumbnail?.label?.text = self.question?.question
        self.thumbnail?.imageView?.image = image
        if let size = image?.size {
            let aspectRatio = size.width / size.height
            self.thumbnailAspectRatio = self.thumbnailAspectRatio?.createConstraint(aspectRatio)
        }
        
        self.title = "Question \(QuestionServer.sharedInstance.count)"
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.hidesBackButton = true
        self.nextButton?.enabled = false
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        self.question = QuestionServer.sharedInstance.randomQuestion()
        setupView()
    }
    
    @IBAction func buttonPressed(button: UIBarButtonItem) {
        if button == self.nextButton {
            if QuestionServer.sharedInstance.hasMoreQuestions() {
                let storyboard = UIStoryboard.init(name: "Main", bundle: NSBundle.mainBundle())
                let viewController = storyboard.instantiateViewControllerWithIdentifier("QuestionViewController")
                self.navigationController?.pushViewController(viewController, animated: true)
            } else {
                self.performSegueWithIdentifier("ResultSegue", sender: button)
            }
            
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "ResultSegue" {
            guard let viewController = segue.destinationViewController as? ResultsViewController else {
                return
            }
            viewController.character = QuestionServer.sharedInstance.getCharacter()
        }
    }

}

extension QuestionViewController: UITableViewDataSource {
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.question?.answers.count ?? 0
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCellWithIdentifier("AnswerCell") as? CEAnswerTableViewCell else {
            fatalError("Cell cannot be nil")
        }
        cell.questionLabel?.text = self.question?.answers[indexPath.row].answer
        return cell
    }
}

extension QuestionViewController: UITableViewDelegate {
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.question?.selectedAnswer = self.question?.answers[indexPath.row]
        self.index = indexPath.row
        self.nextButton?.enabled = true
    }
}

private extension NSLayoutConstraint {
    func createConstraint(multiplier: CGFloat) -> NSLayoutConstraint {
        return NSLayoutConstraint(item: self.firstItem,
                                  attribute: self.firstAttribute,
                                  relatedBy: self.relation,
                                  toItem: self.secondItem,
                                  attribute: self.secondAttribute,
                                  multiplier: multiplier,
                                  constant: self.constant)
    }
}
