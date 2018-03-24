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
    
    var flights = [Flight]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func searchAction(_ sender: Any) {
        
        let sv = UIViewController.displaySpinner(onView: self.view)
        let airportName: String = airportCode.text!
        let minutesBefore: String = minutesBehind.text!
        let minutesAfter: String = minutesAhead.text!
        
        FlightWebService().getFlightData(for: airportName, minutesBehind: minutesBefore, minutesAhead: minutesAfter, completion: { data in
            self.flights = data
            self.performSegue(withIdentifier: "goToSearch", sender: self)
            UIViewController.removeSpinner(spinner: sv)
        })
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! ViewController
        destinationVC.flights = self.flights
    }
}

extension UIViewController {
    
    class func displaySpinner(onView : UIView) -> UIView {
        let spinnerView = UIView.init(frame: onView.bounds)
        spinnerView.backgroundColor = UIColor.init(red: 0.5, green: 0.5, blue: 0.5, alpha: 0.5)
        let ai = UIActivityIndicatorView.init(activityIndicatorStyle: .whiteLarge)
        ai.startAnimating()
        ai.center = spinnerView.center
        DispatchQueue.main.async {
            spinnerView.addSubview(ai)
            onView.addSubview(spinnerView)
        }
        return spinnerView
    }
    
    class func removeSpinner(spinner :UIView) {
        DispatchQueue.main.async {
            spinner.removeFromSuperview()
        }
    }
}
