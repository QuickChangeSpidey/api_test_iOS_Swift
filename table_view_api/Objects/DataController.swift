//
//  DataController.swift
//  table_view_api
//
//  Created by Akshay Pandey on 3/24/18.
//  Copyright © 2018 Akshay. All rights reserved.
//

import Foundation
import CoreData

class DataController {
    let persistentContainer: NSPersistentContainer
    var viewContext: NSManagedObjectContext{
        return persistentContainer.viewContext
    }
    
    init(modelName: String){
        persistentContainer = NSPersistentContainer(name: modelName)
    }
    
    func load(completion: (()->Void)? = nil){
        persistentContainer.loadPersistentStores {storeDesciption, error in
            guard error == nil else {
                fatalError(error!.localizedDescription)
            }
            completion?()
        }
    }
}
