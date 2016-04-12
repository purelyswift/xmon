//
//  Mutant.swift
//  Xmon
//
//  Created by Brian Voong on 4/12/16.
//  Copyright © 2016 mm. All rights reserved.
//

import UIKit
import CoreData

class Mutant: NSManagedObject {
    
    func attributedDescriptionText() -> NSAttributedString {
        let attributedText = NSMutableAttributedString(string: name!, attributes: [NSFontAttributeName: UIFont.boldSystemFontOfSize(18)])
        
        if let unwrappedHumanName = self.humanName, unwrappedCharacterOverview = self.characterOverview {
            attributedText.appendAttributedString(NSAttributedString(string: " - \(unwrappedHumanName)", attributes: [NSFontAttributeName: UIFont.systemFontOfSize(18), NSForegroundColorAttributeName: UIColor.blueColor()]))
            
            attributedText.appendAttributedString(NSAttributedString(string: "\n\n\(unwrappedCharacterOverview)", attributes: [NSFontAttributeName: UIFont.systemFontOfSize(14), NSForegroundColorAttributeName: UIColor.darkGrayColor()]))
        }
        
        return attributedText
    }
    
}
