//
//  BaseCell.swift
//  MarvelsXmon
//
//  Created by Brian Voong on 4/12/16.
//  Copyright © 2016 mm. All rights reserved.
//

import UIKit

class BaseCell: UICollectionViewCell {
    
    func addBottomSeparatorView() {
        super.awakeFromNib()
        
        let separatorView = UIView()
        separatorView.backgroundColor = UIColor(white: 0.5, alpha: 0.5)
        separatorView.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(separatorView)
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|-8-[separatorView]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["separatorView": separatorView]))
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:[separatorView(0.5)]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["separatorView": separatorView]))
    }
    
}
