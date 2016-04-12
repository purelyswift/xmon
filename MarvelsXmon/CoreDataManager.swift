//
//  CoreDataManager.swift
//  MarvelsXmon
//
//  Created by Brian Voong on 4/12/16.
//  Copyright © 2016 mm. All rights reserved.
//

import UIKit
import CoreData

class CoreDataManager: NSObject {
    
    static let sharedInstance = CoreDataManager()
    
    func setupCoreData() {
        removeAllEntities()
        insertMutants()
    }
    
    private func removeAllEntities() {
        do {
            
            let appDelegate = UIApplication.sharedApplication().delegate as? AppDelegate
            if let context = appDelegate?.managedObjectContext {
                for entityName in ["Mutant", "Power"] {
                    let fetchRequest = NSFetchRequest(entityName: entityName)
                    if let entities = try context.executeFetchRequest(fetchRequest) as? [NSManagedObject] {
                        for entity in entities {
                            context.deleteObject(entity)
                        }
                    }
                }
            }
            
        } catch let err {
            print(err)
        }
    }
    
    private func insertMutants() {
        let appDelegate = UIApplication.sharedApplication().delegate as? AppDelegate
        if let context = appDelegate?.managedObjectContext {
            let cyclops = NSEntityDescription.insertNewObjectForEntityForName("Mutant", inManagedObjectContext: context) as! Mutant
            cyclops.name = "Cyclops"
            cyclops.humanName = "Scott Summers"
            cyclops.characterOverview = "Cyclops is a fictional superhero appearing in American comic books published by Marvel Comics and is a founding member of the X-Men. Created by writer Stan Lee and artist Jack Kirby, the character first appeared in the comic book The X-Men #1 (September 1963)"
            
            let eyeBeam = NSEntityDescription.insertNewObjectForEntityForName("Power", inManagedObjectContext: context) as! Power
            eyeBeam.name = "Eye Beam"
            cyclops.powers = NSSet(objects: eyeBeam)

            let wolverine = NSEntityDescription.insertNewObjectForEntityForName("Mutant", inManagedObjectContext: context) as! Mutant
            wolverine.name = "Wolverine"
            wolverine.humanName = "Logan (James Howlett)"
            wolverine.characterOverview = "Wolverine is one of the main characters of Marvel's X-Men series.  His character has powers that allow him to rejuvenate unlike any other mutant.  Oh yeah he has claws too."
            
            let rejuvenation = NSEntityDescription.insertNewObjectForEntityForName("Power", inManagedObjectContext: context) as! Power
            rejuvenation.name = "Rejuvenation"
            
            let claws = NSEntityDescription.insertNewObjectForEntityForName("Power", inManagedObjectContext: context) as! Power
            claws.name = "Adamantium Claws"
            
            wolverine.powers = NSSet(objects: rejuvenation, claws)
            
            let professorX = NSEntityDescription.insertNewObjectForEntityForName("Mutant", inManagedObjectContext: context) as! Mutant
            professorX.name = "Professor X"
            professorX.humanName = "Charles Xavier"
            professorX.characterOverview = "Professor X is the leader of the X-Men team.  He has the powers of telepathy to read minds and even more impressive, the power of Mind Control.  One of his students, Jean Grey, also possess the same type of powers.  However, she is not as strong as Charles is but is a close rival.  Professor X's ultimate nemesis is ironically his childhood friend who grew up to be Magneto.  The story of X-Men usually revoles around their struggles to fight against each other and the human race."
            let telepathy = NSEntityDescription.insertNewObjectForEntityForName("Power", inManagedObjectContext: context) as! Power
            telepathy.name = "Telepathy"
            professorX.powers = NSSet(objects: telepathy)
            
            do {
                try context.save()
            } catch let err {
                print(err)
            }
        }
    }
    
    func fetchMutants() -> [Mutant]? {
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let context = appDelegate.managedObjectContext
        let request = NSFetchRequest(entityName: "Mutant")
        request.sortDescriptors = [NSSortDescriptor(key: "name", ascending: true)]
        do {
            return try context.executeFetchRequest(request) as? [Mutant]
        } catch let err {
            print(err)
        }
        return nil
    }
    
}
