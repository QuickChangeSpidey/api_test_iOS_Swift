//
//  FlightTableViewCell.swift
//  table_view_api
//
//  Created by Akshay on 3/21/18.
//  Copyright © 2018 Akshay. All rights reserved.
//

import UIKit

class FlightTableViewCell: UITableViewCell {
    @IBOutlet weak var sourceCellText: UITextField!
    @IBOutlet weak var destinationCellText: UITextField!
    
    @IBOutlet weak var statusCellText: UITextField!
    @IBOutlet weak var carrierCellText: UITextField!
    @IBOutlet weak var departureCellText: UITextField!
    @IBOutlet weak var flightIdCellText: UITextField!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
