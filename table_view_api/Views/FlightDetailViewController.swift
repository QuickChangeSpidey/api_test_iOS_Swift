//
//  FlightDetailViewCntroller.swift
//  table_view_api
//
//  Created by Akshay Pandey on 3/22/18.
//  Copyright © 2018 Akshay. All rights reserved.
//

import Foundation
import UIKit

class FlightDetailViewController : UIViewController{

    var flight: Flight!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        print(self.flight)
    }
}
