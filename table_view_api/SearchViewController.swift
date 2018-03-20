//
//  SearchViewController.swift
//  table_view_api
//
//  Created by Akshay on 3/20/18.
//  Copyright © 2018 Akshay. All rights reserved.
//

import Foundation
import UIKit

class SearchViewController : UIViewController{
    
    @IBOutlet weak var searchButton: UIButton!
    @IBOutlet weak var minutesBehind: UITextField!
    @IBOutlet weak var minutesAhead: UITextField!
    @IBOutlet weak var airportCode: UITextField!
    
    var data: NSData!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func searchAction(_ sender: Any) {
        
        var airportName: String = airportCode.text!
        var minutesBefore: String = minutesBehind.text!
        var minutesAfter: String = minutesAhead.text!
        
        
        
        performSegue(withIdentifier: "goToSearch", sender: self)
    }
    
}
