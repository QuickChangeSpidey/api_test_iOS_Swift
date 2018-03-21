//
//  FlightWebService.swift
//  table_view_api
//
//  Created by Akshay on 3/20/18.
//  Copyright © 2018 Akshay. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class FlightWebService: NSObject {
    var data = [String: AnyObject]();
    func getFlightData(airportCode: String, minutesBehind: String, minutesAhead:String, completion: (()?)->Void) -> [String: AnyObject] {
        let securityToken: String = "Basic YWFnZTQxNDAxMjgwODYyNDk3NWFiYWNhZjlhNjZjMDRlMWY6ODYyYTk0NTFhYjliNGY1M2EwZWJiOWI2ZWQ1ZjYwOGM="
        var headers: HTTPHeaders = [:]
        headers["Authorization"] = securityToken
        let parameters: Parameters = ["city": airportCode, "minutesBehind" : minutesBehind, "miutesAhead" :minutesAhead]
                Alamofire.request("https://api.qa.alaskaair.com/1/airports/"+airportCode+"/flights/flightInfo", parameters: parameters, headers: headers).responseJSON { (response) in
                    switch response.result {
                    case .success:
                        if let json = response.result.value {
                            self.data = [String: AnyObject]();
                            if let dict = json as? [String: AnyObject]{
                                // Dictionary found
                                self.data = dict;
                            }
                            else if let list = json as? [AnyObject] {
                                // Array found
                                self.data = ["data":list as AnyObject];
                            }
                        }
                    case .failure(let error):
                        print("status code: \(error.localizedDescription)")
                        let alert = UIAlertController(title: "Error", message: "Something went wrong. Please try again later!", preferredStyle: .alert)
                                                alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
                                                UIApplication.shared.keyWindow?.rootViewController?.present(alert, animated: true, completion: nil)
                    }
                }
        return self.data
  }
}
