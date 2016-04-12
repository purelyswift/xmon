//
//  PowerCell.swift
//  MarvelsXmon
//
//  Created by Brian Voong on 4/12/16.
//  Copyright © 2016 mm. All rights reserved.
//

import UIKit

class PowerCell: BaseCell {
    
    var power: Power? {
        didSet {
            powerLabel.text = power?.name
        }
    }
    
    @IBOutlet private weak var powerLabel: UILabel!
    
    override var highlighted: Bool {
        didSet {
            backgroundColor = highlighted ? UIColor(white: 0.5, alpha: 1) : UIColor.whiteColor()
            powerLabel.textColor = highlighted ? UIColor.whiteColor() : UIColor.blackColor()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        powerLabel.font = UIFont.boldSystemFontOfSize(16)
        addBottomSeparatorView()
    }
    
}
