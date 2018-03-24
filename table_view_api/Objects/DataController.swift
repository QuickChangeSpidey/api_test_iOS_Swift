//
//  DataController.swift
//  table_view_api
//
//  Created by Akshay Pandey on 3/24/18.
//  Copyright © 2018 Akshay. All rights reserved.
//

import Foundation
import UIKit
import CoreData
class DataController: NSObject {
    var managedObjectContext: NSManagedObjectContext
    init(completionClosure: @escaping () -> ()) {
        persistentContainer = NSPersistentContainer(name: "DataModel")
        persistentContainer.loadPersistentStores() { (description, error) in
            if let error = error {
                fatalError("Failed to load Core Data stack: \(error)")
            }
            completionClosure()
        }
    }
}
