//
//  EditPowersController.swift
//  MarvelsXmon
//
//  Created by Brian Voong on 4/12/16.
//  Copyright © 2016 mm. All rights reserved.
//

import UIKit

class EditPowersController: UIViewController {
    
    var power: Power? {
        didSet {
            navigationItem.title = power?.name
        }
    }
    
    let nameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter Power Name"
        textField.font = UIFont.systemFontOfSize(16)
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.borderStyle = .RoundedRect
        
        return textField
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .Plain, target: self, action: "handleSave")
        
        view.backgroundColor = UIColor.whiteColor()
        
        view.addSubview(nameTextField)
        view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:[nameTextField(200)]", options: NSLayoutFormatOptions(), metrics: nil, views: ["nameTextField": nameTextField]))
        view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:[nameTextField(40)]", options: NSLayoutFormatOptions(), metrics: nil, views: ["nameTextField": nameTextField]))
        
        view.addConstraint(NSLayoutConstraint(item: nameTextField, attribute: .CenterX, relatedBy: .Equal, toItem: view, attribute: .CenterX, multiplier: 1, constant: 0))
        view.addConstraint(NSLayoutConstraint(item: nameTextField, attribute: .CenterY, relatedBy: .Equal, toItem: view, attribute: .CenterY, multiplier: 1, constant: 0))
    }
    
    func handleSave() {
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let context = appDelegate.managedObjectContext
        
        do {
            
            power?.name = nameTextField.text
            try context.save()
            
            navigationController?.popViewControllerAnimated(true)
            
        } catch let err {
            print(err)
        }
    }
    
}
