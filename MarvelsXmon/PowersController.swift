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
        
        collectionView?.alwaysBounceVertical = true
        collectionView?.backgroundColor = UIColor.whiteColor()
        if let flowLayout = collectionView?.collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout.minimumLineSpacing = 0
        }
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        collectionView?.reloadData()
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
    
    override func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        let editPowersController = EditPowersController()
        editPowersController.power = powers?[indexPath.item]
        navigationController?.pushViewController(editPowersController, animated: true)
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return CGSizeMake(view.frame.width, 80)
    }
    
}
