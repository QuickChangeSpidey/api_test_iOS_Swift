//
//  ViewController.swift
//  table_view_api
//
//  Created by Akshay on 3/19/18.
//  Copyright © 2018 Akshay. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
        
    var flights = [Flight]()

    @IBOutlet weak var flightTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        flightTableView.delegate = self
        flightTableView.dataSource = self
        print(self.flights)
        
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell,
                   forRowAt indexPath: IndexPath)
    {
        if (indexPath.row % 2 == 0)
        {
            cell.backgroundColor = colorForIndex(index: indexPath.row)
        } else {
            cell.backgroundColor = UIColor.white
        }
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.flights.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? FlightTableViewCell  else {
            fatalError("The dequeued cell is not an instance of MealTableViewCell.")
        }
        let flight = flights[indexPath.row]
        
        cell.carrierCellText.text = flight.Carrier
        cell.destinationCellText.text = flight.Dest
        cell.departureCellText.text = flight.SchedDepTime
        cell.flightIdCellText.text = flight.FltId
        cell.sourceCellText.text = flight.Orig
        cell.statusCellText.text = flight.Status
        
        return cell
    }
    
    func colorForIndex(index: Int) -> UIColor
    {
        let itemCount = self.flights.count - 1
        return UIColor(red: 0.9137, green: 0.9294, blue: 0, alpha: 1)
    }
    
    
    
}


