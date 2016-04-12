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
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        addBottomSeparatorView()
    }
    
}
