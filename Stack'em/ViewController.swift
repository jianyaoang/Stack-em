//
//  ViewController.swift
//  Stack'em
//
//  Created by Jian Yao Ang on 12/20/15.
//  Copyright © 2015 Jian Yao Ang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var isLightSide: Bool = false
    let characterDetails: UILabel = UILabel()
    let secondCharacterDetail: UILabel = UILabel()
    
    
    @IBOutlet var introductionVerticalStackView: UIStackView!
    
    @IBOutlet var titleLabel: UILabel! {
        didSet {
            titleLabel.text = "The Force Awakens"
        }
    }
    @IBOutlet var movieLabel: UILabel! {
        didSet {
            movieLabel.text = "The Force is strong with you"
        }
    }
    
    @IBOutlet var instructionLabel: UILabel! {
        didSet {
            instructionLabel.text = "Which side are you on?"
        }
    }
    
    
    @IBOutlet var darkSideButton: UIButton! {
        didSet {
            darkSideButton.setTitle("Dark Side", forState: UIControlState.Normal)
        }
    }
    
    @IBOutlet var lightSideButton: UIButton! {
        didSet {
            lightSideButton.setTitle("Light Side", forState: UIControlState.Normal)
        }
    }
    
    
    @IBOutlet var characterHorizontalStackView: UIStackView! {
        didSet {
            characterHorizontalStackView.layoutMargins = UIEdgeInsetsMake(0, 10, 0, 10)
            characterHorizontalStackView.layoutMarginsRelativeArrangement = true
        }
    }
    
    @IBOutlet var characterOneButton: UIButton! {
        didSet {
            characterOneButton.setTitle("", forState: UIControlState.Normal)
            characterOneButton.alpha = 0
            characterOneButton.imageView?.contentMode = UIViewContentMode.ScaleAspectFill;
        }
    }
    
    
    @IBOutlet var characterTwoButton: UIButton! {
        didSet {
            characterTwoButton.setTitle("", forState: UIControlState.Normal)
            characterTwoButton.alpha = 0
            characterTwoButton.imageView?.contentMode = UIViewContentMode.ScaleAspectFill
        }
    }
    
    
    @IBOutlet var descriptionVerticalStackView: UIStackView! {
        didSet {
            
            /*
                backgroundColor property doesn't work for UIStackView
                REASON: UIStackView is a subclass of UIView. Hence, it inherits the property of backgroundColor. However, UIStackView is a non-drawing view. What this means is drawRect method is never called, and thus, no background color
            
            */
            
//            descriptionVerticalStackView.backgroundColor = UIColor.redColor()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    
    @IBAction func onLightSideButtonPressed(sender: AnyObject) {
        
        self.descriptionVerticalStackView.removeArrangedSubview(self.characterDetails)
        self.descriptionVerticalStackView.removeArrangedSubview(self.secondCharacterDetail)
        self.characterDetails.removeFromSuperview()
        self.secondCharacterDetail.removeFromSuperview()
    
        isLightSide = true
        if (self.characterOneButton.alpha == 1 && self.characterTwoButton.alpha == 1) {
            self.characterOneButton.alpha = 0
            self.characterTwoButton.alpha = 0
        }
        
    
        UIView.animateWithDuration(2.0, animations: { () -> Void in
            
            self.characterOneButton.alpha = 1
            self.characterTwoButton.alpha = 1
            
            self.characterOneButton.setImage(UIImage(named: "yoda"), forState: UIControlState.Normal)
            self.characterTwoButton.setImage(UIImage(named: "obi-wan"), forState: UIControlState.Normal)
            
            }) { (finish) -> Void in
                print("animation complete light side")
        }
    }
    
    @IBAction func onDarkSideButtonPressed(sender: AnyObject) {
        
        self.descriptionVerticalStackView.removeArrangedSubview(self.characterDetails)
        self.descriptionVerticalStackView.removeArrangedSubview(self.secondCharacterDetail)
        self.characterDetails.removeFromSuperview()
        self.secondCharacterDetail.removeFromSuperview()
        
    
        isLightSide = false
        if (self.characterOneButton.alpha == 1 && self.characterTwoButton.alpha == 1) {
            
            self.characterOneButton.alpha = 0
            self.characterTwoButton.alpha = 0
        }
        
        UIView.animateWithDuration(2.0, animations: { () -> Void in
            
            self.characterOneButton.alpha = 1
            self.characterTwoButton.alpha = 1
            
            self.characterOneButton.setImage(UIImage(named: "darth-sidious"), forState: UIControlState.Normal)
            self.characterTwoButton.setImage(UIImage(named: "darth_vader"), forState: UIControlState.Normal)
            
            }) { (finish) -> Void in
                print("animation complete dark side")
        }
    }
    
    
    @IBAction func onCharacterOneButtonPressed(sender: AnyObject) {
        
        characterDetails.alpha = 0
        characterDetails.numberOfLines = 0
        secondCharacterDetail.alpha = 0
        secondCharacterDetail.numberOfLines = 0
        
        if (isLightSide == false) {
            characterDetails.text = "Darth Sidious. A Dark Lord of the Sith in the Order of the Sith Lords, recorded by history as the most powerful who had ever lived"
            secondCharacterDetail.text = "A Force-sensitive Human male who served as the last Supreme Chancellor of the Galactic Republic and the first Emperor of the Galactic Empire"
        } else {
            characterDetails.text = "Master Yoda. He was known for his legendary wisdom, mastery of the Force and skills in lightsaber combat."
            secondCharacterDetail.text = " He served as a member of the Jedi Council in the last centuries of the Galactic Republic and as Grand Master oversaw the Jedi Order before, during and after the devastating Clone Wars"
        }
        
        UIView.animateWithDuration(2, animations: { () -> Void in
            
            self.descriptionVerticalStackView.removeArrangedSubview(self.characterDetails)
            self.descriptionVerticalStackView.removeArrangedSubview(self.secondCharacterDetail)
            self.characterDetails.removeFromSuperview()
            self.secondCharacterDetail.removeFromSuperview()
            
            self.characterDetails.alpha = 1
            self.secondCharacterDetail.alpha = 1
            
            self.descriptionVerticalStackView.addArrangedSubview(self.characterDetails)
            self.descriptionVerticalStackView.addArrangedSubview(self.secondCharacterDetail)

            
            }) { (finished) -> Void in
        
            self.descriptionVerticalStackView.layoutIfNeeded()
        }
    }
    

    @IBAction func onCharacterTwoButtonPressed(sender: AnyObject) {
        
        characterDetails.alpha = 0
        characterDetails.numberOfLines = 0
        secondCharacterDetail.alpha = 0
        secondCharacterDetail.numberOfLines = 0
        
        if (isLightSide == false) {
            characterDetails.text = "Darth Vader. Before this, he was known as the Jedi by the name, Anakin Skywalker"
            secondCharacterDetail.text = "Lucasfilm has said that Darth Vader is the most popular and profitable character in all of the Star Wars universe"
        } else {
            characterDetails.text = "Obi-Wan Kenobi. The Master of Anakin Skywalker"
            secondCharacterDetail.text = "Obi-Wan Kenobi became the first Jedi in a millennium to defeat a Sith Lord when he defeated Darth Maul during the Battle of Naboo"
        }
        
        UIView.animateWithDuration(2, animations: { () -> Void in
            
            self.descriptionVerticalStackView.removeArrangedSubview(self.characterDetails)
            self.descriptionVerticalStackView.removeArrangedSubview(self.secondCharacterDetail)
            self.characterDetails.removeFromSuperview()
            self.secondCharacterDetail.removeFromSuperview()
            
            self.characterDetails.alpha = 1
            self.descriptionVerticalStackView.addArrangedSubview(self.characterDetails)
            
            self.secondCharacterDetail.alpha = 1
            self.descriptionVerticalStackView.addArrangedSubview(self.secondCharacterDetail)
            
            }) { (finished) -> Void in

                self.descriptionVerticalStackView.layoutIfNeeded()
                
        }
        
    }
    
}
