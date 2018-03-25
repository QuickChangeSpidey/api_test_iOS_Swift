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
            self.autoSaveViewContext(interval: 20)
        }
    }
}

extension DataController{
    
    func autoSaveViewContext(interval: TimeInterval = 30){
        print("AUTO SAVING")
        
        guard interval > 0 else {
            print ("cannot set negative time interval")
            return
        }
        
        if viewContext.hasChanges {
            try? viewContext.save()
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now()+interval) {
            self.autoSaveViewContext(interval: interval)
        }
        
    }
    
}

