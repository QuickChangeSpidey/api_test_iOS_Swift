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
        

        let fetchRequest:NSFetchRequest<Result> = Result.fetchRequest()
        let sortDescriptor = NSSortDescriptor(key: "time", ascending: false)
        fetchRequest.sortDescriptors = [sortDescriptor]
        if let result = try? self.dataController.viewContext.fetch(fetchRequest){
            data = result
        }
            
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "historycell", for: indexPath) as? HistoryTableViewCell  else {
            fatalError("The dequeued cell is not an instance of HistoryTableViewCell.")
        }
        
        let result = self.data[indexPath.row]
        cell.airportCodeText.text = result.city!
        cell.minutesAfterText.text = result.minutesAfter!
        cell.minutesBeforeText.text = result.minutesBehind!
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy/MMM/dd HH:mm:ss"
            
        let timeString = dateFormatter.string(from: result.time!)
        cell.timeText.text = timeString

        return cell
    }
    
    
    
    
    
}
