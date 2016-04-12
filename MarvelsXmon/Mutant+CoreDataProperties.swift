//
//  Mutant+CoreDataProperties.swift
//  MarvelsXmon
//
//  Created by Brian Voong on 4/12/16.
//  Copyright © 2016 mm. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Mutant {

    @NSManaged var name: String?
    @NSManaged var humanName: String?
    @NSManaged var characterOverview: String?
    @NSManaged var powers: NSSet?

}
