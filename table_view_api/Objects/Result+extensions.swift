//
//  Result.swift
//  table_view_api
//
//  Created by Akshay on 3/27/18.
//  Copyright © 2018 Akshay. All rights reserved.
//

import Foundation
import CoreData

extension Result {
    
    override public func awakeFromInsert() {
        super.awakeFromInsert()
        self.time = Date()
    }
    
    
    
}
