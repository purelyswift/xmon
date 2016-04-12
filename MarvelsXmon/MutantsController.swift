//
//  ViewController.swift
//  MarvelsXmon
//
//  Created by Brian Voong on 4/12/16.
//  Copyright © 2016 mm. All rights reserved.
//

import UIKit

class MutantsController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    var mutants: [Mutant]?
    
    override func viewDidLoad() {
        super.viewDidLoad()

                    CoreDataManager.sharedInstance.setupCoreData()
        mutants = CoreDataManager.sharedInstance.fetchMutants()
        if mutants?.count == 0 {
//            CoreDataManager.sharedInstance.setupCoreData()
        }
        
        navigationItem.title = "Oh My Mutants"
        
        collectionView?.backgroundColor = UIColor.whiteColor()
        collectionView?.alwaysBounceVertical = true
        if let flowLayout = collectionView?.collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout.minimumLineSpacing = 0
        }
    }
    
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let count = mutants?.count {
            return count
        }
        return 0
    }
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("mutantCellId", forIndexPath: indexPath) as! MutantCell
        cell.mutant = mutants?[indexPath.item]
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        
        if let mutant = mutants?[indexPath.item] {
            let attributedText = mutant.attributedDescriptionText()
            let rect = attributedText.boundingRectWithSize(CGSizeMake(view.frame.width - 16, 1000), options: NSStringDrawingOptions.UsesFontLeading.union(NSStringDrawingOptions.UsesLineFragmentOrigin), context: nil)
            return CGSizeMake(view.frame.width, rect.height + 20)
        }
        
        return CGSizeMake(view.frame.width, 80)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        navigationController?.navigationBar.tintColor = UIColor.whiteColor()
        let powersController = segue.destinationViewController as! PowersController
        if let indexPath = collectionView?.indexPathForCell(sender as! UICollectionViewCell) {
            powersController.mutant = mutants?[indexPath.item]
        }
        
        //removes back button text
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .Plain, target: nil, action: nil)
    }
    
}
