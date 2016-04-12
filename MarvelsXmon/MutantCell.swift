//
//  MutantCell.swift
//  Xmon
//
//  Created by Brian Voong on 4/12/16.
//  Copyright © 2016 mm. All rights reserved.
//

import UIKit

class MutantCell: BaseCell {
    
    weak var mutant: Mutant? {
        didSet {
            descriptionTextView.attributedText = mutant?.attributedDescriptionText()
        }
    }
    
    override var highlighted: Bool {
        didSet {
            backgroundColor = highlighted ? UIColor(white: 0.9, alpha: 1) : UIColor.whiteColor()
        }
    }

    @IBOutlet private weak var descriptionTextView: UITextView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        descriptionTextView.contentInset = UIEdgeInsetsMake(0, 8, 0, 8)
        descriptionTextView.scrollEnabled = false
        descriptionTextView.userInteractionEnabled = false
        descriptionTextView.backgroundColor = UIColor.clearColor()
        
        addBottomSeparatorView()
    }
}
