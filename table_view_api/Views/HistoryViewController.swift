//
//  HistoryViewController.swift
//  table_view_api
//
//  Created by Akshay Pandey on 3/26/18.
//  Copyright © 2018 Akshay. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class HistoryViewcontroller: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var historyTableView: UITableView!
    
    var dataController:DataController!
    var data:[Result] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        historyTableView.delegate = self
        historyTableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "historycell", for: indexPath) as? HistoryTableViewCell  else {
            fatalError("The dequeued cell is not an instance of MealTableViewCell.")
        }
        
        let result = self.data[indexPath.row]
        cell.airportCodeText.text = result.city!
        cell.minutesAheadText.text = result.minutesAfter!
        cell.minutesBehindText.text = result.minutesBehind!
        
        return cell
    }
    
    
    
    
    
}
