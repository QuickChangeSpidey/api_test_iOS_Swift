//
//  FlightTableViewCell.swift
//  table_view_api
//
//  Created by Akshay on 3/21/18.
//  Copyright © 2018 Akshay. All rights reserved.
//

import UIKit

class FlightTableViewCell: UITableViewCell {
   
    @IBOutlet weak var destinationCellText: UILabel!
    @IBOutlet weak var flightIDCellText: UILabel!
    @IBOutlet weak var statusCellText: UILabel!
    @IBOutlet weak var carrierCellText: UILabel!
    @IBOutlet weak var departureCellText: UILabel!
    @IBOutlet weak var sourceCellText: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
