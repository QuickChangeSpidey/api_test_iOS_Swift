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
    
    
    var data = [String: AnyObject]();

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func searchAction(_ sender: Any) {
        
        let airportName: String = airportCode.text!
        let minutesBefore: String = minutesBehind.text!
        let minutesAfter: String = minutesAhead.text!
        
        self.data = FlightWebService().getFlightData(airportCode: airportName, minutesBehind: minutesBefore, minutesAhead: minutesAfter)
        print(self.data)

        performSegue(withIdentifier: "goToSearch", sender: self)
    }
    
}
