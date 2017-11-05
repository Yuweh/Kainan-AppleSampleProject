//
//  RatingControl.swift
//  Kainan
//
//  Created by Fulltime on 22/10/2017.
//  Copyright © 2017 University of the Philippines. All rights reserved.
//

import UIKit

@IBDesignable class RatingControl: UIStackView {
    

    //MARLK: Properties
    
    //this made the unseenable and uneditable in storyboard, editable thru adding @IBDesignable and @IBInspectable
    @IBInspectable var starSize: CGSize = CGSize(width: 44.0, height: 44.0) {
        didSet{
            setupButtons()
        }
    }
    
    
    @IBInspectable var startCount: Int = 5 {
        didSet{
            setupButtons()
        }
    }
    
    private var ratingButtons = [UIButton]()
    var rating = 0 {
        didSet {
            updateButtonSelectionStates()
        }
    }
    
    
    //MARK: Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButtons()
    }
    required init(coder: NSCoder) {
        super.init(coder: coder)
        setupButtons()
    }
    
    //MARK: Private Methods
    // Button was pramagtically coded and not seen here at storyboard, this button will be for the rating
    private func setupButtons() {
        
        for button in ratingButtons {
            removeArrangedSubview(button)
            button.removeFromSuperview()
        }
        ratingButtons.removeAll()
        //LOAD Button Images
        let bundle = Bundle(for: type(of: self))
        let filledStar = UIImage(named: "filledStar", in: bundle, compatibleWith: self.traitCollection)
        let emptyStar = UIImage(named: "emptyStar", in: bundle, compatibleWith: self.traitCollection)
        let highlightedStar = UIImage(named: "highlightedStar", in: bundle, compatibleWith: self.traitCollection)
        
        
        // LOOP the images where repeated and below code was the state of button was re-stated
        for index in 0..<5 {
            let button = UIButton()
            button.setImage(emptyStar, for: .normal)
            button.setImage(filledStar, for: .selected)
            button.setImage(highlightedStar, for: .highlighted)
            button.setImage(highlightedStar, for: [.highlighted, .selected])
            button.translatesAutoresizingMaskIntoConstraints = false
            button.heightAnchor.constraint(equalToConstant: starSize.height).isActive = true
            button.widthAnchor.constraint(equalToConstant: starSize.width).isActive = true
            button.accessibilityLabel = "Set \(index + 1) star rating"
            button.addTarget(self, action: #selector(ratingButtonTapped(button:)), for: .touchUpInside)
            addArrangedSubview(button)
            ratingButtons.append(button)
        }
        updateButtonSelectionStates()
    }
    
    //MARK: Action
    
    @objc func ratingButtonTapped(button: UIButton)   {
        print("Button was pressed 😇")
        guard  let index = ratingButtons.index(of: button) else {
            fatalError("the button , \(button), is not in the ratingButtons array:\(ratingButtons)")
        }
        let selectedRating = index + 1
        if selectedRating == rating {
            rating = 0
        }
        else {
            rating = selectedRating
        }
    }
    
    private func updateButtonSelectionStates() {
        for (index, button) in ratingButtons.enumerated() {
            
            button.isSelected = index < rating
            let hintString: String?
            if rating == index + 1 {
                hintString = "Tap to reset the rating to zero."
            } else {
                hintString = nil
            }
            let valueString: String
            switch (rating) {
                case 0: valueString = "No rating set."
                case 1: valueString = "1 Star set."
            default: valueString = "\(rating) stars set."
            }
            button.accessibilityHint = hintString
            button.accessibilityValue = valueString 
        }
    }
}

/*
 // Only override draw() if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 override func draw(_ rect: CGRect) {
 // Drawing code
 }
 */

