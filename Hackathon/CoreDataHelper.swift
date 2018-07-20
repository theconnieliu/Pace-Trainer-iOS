//
//  CoreDataHelper.swift
//  MakeSchoolNotes
//
//  Created by Tania Ortiz-Rosales on 7/9/18.
//  Copyright © 2018 MakeSchool. All rights reserved.
//

import Foundation
import UIKit
import CoreData

struct CoreDataHelper {
    static let context: NSManagedObjectContext = {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            fatalError()
        }
        
        let persistentContainer = appDelegate.persistentContainer
        let context = persistentContainer.viewContext
        
        return context
    }()
    
    static func newRunInfo() -> RunInfo {
        let runInfo = NSEntityDescription.insertNewObject(forEntityName: "RunInfo", into: context) as! RunInfo
        
        return runInfo
    }
    
    static func saveRunInfo() {
        do {
            try context.save()
        } catch let error {
            print("Could not save \(error.localizedDescription)")
        }
    }
    
    static func delete(runInfo: RunInfo) {
        context.delete(runInfo)
        saveRunInfo()
    }
    
    static func retrieveRunInfos() -> [RunInfo] {
        do {
            let fetchRequest = NSFetchRequest<RunInfo>(entityName: "RunInfo")
            let results = try context.fetch(fetchRequest)
            
            return results
        } catch let error {
            print("Could not fetch \(error.localizedDescription)")
            
            return []
        }
        
    }
}

