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
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.flights.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = flightTableView.dequeueReusableCell(withIdentifier: "cell")
        cell?.textLabel?.text = "test"
        cell?.detailTextLabel?.text = "$0"
        
        return cell!
    }
}


