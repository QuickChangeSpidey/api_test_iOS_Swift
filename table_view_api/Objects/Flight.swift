//
//  Flight.swift
//  table_view_api
//
//  Created by Akshay on 3/21/18.
//  Copyright © 2018 Akshay. All rights reserved.
//

import UIKit
import Foundation

struct Flight: Codable{
    let FltId, Carrier, Orig, Dest, CutOffTime, SchedDepTime, EstDepTime, SchedArrTime, EstArrTime, ActualTime, OrigZuluOffset, DestZuluOffset, DestGate, OrigGate, TailId, FleetType, Status: String!, CodeShares:[CodeShare]!, FltDirection: Int!
}

