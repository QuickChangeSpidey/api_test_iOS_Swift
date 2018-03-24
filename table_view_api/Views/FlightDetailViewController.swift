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

    @IBOutlet weak var tailIdText: UILabel!
    @IBOutlet weak var fleetText: UILabel!
    @IBOutlet weak var statusText: UILabel!
    @IBOutlet weak var origGateText: UILabel!
    @IBOutlet weak var destGateText: UILabel!
    @IBOutlet weak var actualTimeText: UILabel!
    @IBOutlet weak var estimatedArrivalText: UILabel!
    @IBOutlet weak var scheduledArrivalText: UILabel!
    @IBOutlet weak var estimatedText: UILabel!
    @IBOutlet weak var scheduledDepText: UILabel!
    @IBOutlet weak var cutOffTimeText: UILabel!
    @IBOutlet weak var destinationText: UILabel!
    @IBOutlet weak var flightIdText: UILabel!
    @IBOutlet weak var carrierText: UILabel!
    @IBOutlet weak var OriginText: UILabel!
    var flight: Flight!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.tailIdText.text = self.tailIdText.text! + " " + self.flight.TailId
        self.fleetText.text = self.fleetText.text! + " " + self.flight.FleetType
        self.statusText.text = self.statusText.text! + " " + self.flight.Status
        self.origGateText.text = self.origGateText.text! + " " + self.flight.OrigGate
        self.destGateText.text = self.destGateText.text! + " " + self.flight.DestGate
        self.actualTimeText.text = self.actualTimeText.text! + " " + self.flight.ActualTime
        self.estimatedText.text = self.estimatedText.text! + " " + self.flight.EstArrTime
        self.scheduledArrivalText.text = self.scheduledArrivalText.text! + " " + self.flight.SchedArrTime
        self.scheduledDepText.text = self.scheduledDepText.text! + " " + self.flight.SchedDepTime
        self.cutOffTimeText.text = self.cutOffTimeText.text! + " " + self.flight.CutOffTime
        self.destinationText.text = self.destinationText.text! + " " + self.flight.Dest
        self.OriginText.text = self.OriginText.text! + " " + self.flight.Orig
        self.flightIdText.text = self.flightIdText.text! + " " + self.flight.FltId
        self.carrierText.text = self.carrierText.text! + " " + self.flight.Carrier
        
        
    }
}
