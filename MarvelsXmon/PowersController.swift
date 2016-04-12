//
//  PowersController.swift
//  MarvelsXmon
//
//  Created by Brian Voong on 4/12/16.
//  Copyright © 2016 mm. All rights reserved.
//

import UIKit

class PowersController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    var mutant: Mutant? {
        didSet {
            navigationItem.title = mutant?.name
            
            powers = mutant?.powers?.allObjects as? [Power]
        }
    }
    
    private var powers: [Power]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        
        collectionView?.backgroundColor = UIColor.whiteColor()
    }
    
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let count = powers?.count {
            return count
        }
        return 0
    }
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("powerCellId", forIndexPath: indexPath) as! PowerCell
        
        cell.power = powers?[indexPath.item]
        
        return cell
    }
    
}
