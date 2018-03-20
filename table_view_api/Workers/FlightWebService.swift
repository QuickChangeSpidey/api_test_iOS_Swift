//
//  FlightWebService.swift
//  table_view_api
//
//  Created by Akshay on 3/20/18.
//  Copyright © 2018 Akshay. All rights reserved.
//

import UIKit
import Alamofire


class FlightWebService: NSObject {
    
    var data: NSData!
    
    func getFlightData(airportCode: String, minutesBehind: String, minutesAhead:String){
        
        let securityToken: String = "Basic YWFnZTQxNDAxMjgwODYyNDk3NWFiYWNhZjlhNjZjMDRlMWY6ODYyYTk0NTFhYjliNGY1M2EwZWJiOWI2ZWQ1ZjYwOGM="
        
        var headers: HTTPHeaders = [:]
        headers["Authorization"] = securityToken
        
        let parameters: Parameters = ["city": airportCode, "minutesBehind" : minutesBehind, "miutesAhead" :minutesAhead]
        
        
        Alamofire.request("https://api.qa.alaskaair.com/1/airports/"+airportCode+"/flights/flightInfo", parameters: parameters, headers: headers).responseJSON { (response) in
            print(response)
            var err: NSError?

        }
        
        
        
    
        

        
    }
    

}
