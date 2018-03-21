//
//  FlightWebService.swift
//  table_view_api
//
//  Created by Akshay on 3/20/18.
//  Copyright © 2018 Akshay. All rights reserved.
//

import UIKit


class FlightWebService: NSObject {
    
    enum Result<Value> {
        case success(Array<Flight>)
        case failure(Error)
    }
    
    struct Response: Codable {
        let flights: [Flight]
    }
    
    struct Flight: Codable{
        let FltId, Carrier, Orig, Dest, CutOffTime, SchedDepTime, EstDepTime, SchedArrTime, EstArrTime, ActualTime, OrigZuluOffset, DestZuluOffset, DestGate, OrigGate, TailId, FleetType, Status: String, CodeShares:[CodeShare], FltDirection: Int
    }
    struct CodeShare: Codable {
        let FltId, Carrier: String
    }

    func getFlightData(for airportCode: String, minutesBehind:String, minutesAhead:String, completion: ((Result<[Response]>) -> Void)?) {
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "api.qa.alaskaair.com"
        urlComponents.path = "/1/airports/"+airportCode+"/flights/flightInfo"
        urlComponents.queryItems = [
            URLQueryItem(name: "city", value: airportCode),
            URLQueryItem(name: "minutesBehind", value: minutesBehind),
            URLQueryItem(name: "minutesAhead", value: minutesAhead)
            
        ]
        
        guard let url = urlComponents.url else { fatalError("Could not create URL from components") }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("Basic YWFnZTQxNDAxMjgwODYyNDk3NWFiYWNhZjlhNjZjMDRlMWY6ODYyYTk0NTFhYjliNGY1M2EwZWJiOWI2ZWQ1ZjYwOGM=", forHTTPHeaderField: "Authorization")
        
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)
        let task = session.dataTask(with: request) { (responseData, response, responseError) in
            DispatchQueue.main.async {
                if let error = responseError {
                    completion?(.failure(error))
                } else if let jsonData = responseData {
                
                    let decoder = JSONDecoder()
                    
                    do {
                      
                        let posts = try decoder.decode(Array<Flight>.self, from: jsonData)
                        completion?(.success(posts))
                    } catch {
                        completion?(.failure(error))
                    }
                } else {
                    let error = NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey : "Data was not retrieved from request"]) as Error
                    completion?(.failure(error))
                }
            }
        }
        
        task.resume()
    }
    
    
    
    
    
    
    
    //    var data = [String: AnyObject]();
//    func getFlightData(airportCode: String, minutesBehind: String, minutesAhead:String, completion: (()?)->Void) -> [String: AnyObject] {
//        let securityToken: String = "Basic YWFnZTQxNDAxMjgwODYyNDk3NWFiYWNhZjlhNjZjMDRlMWY6ODYyYTk0NTFhYjliNGY1M2EwZWJiOWI2ZWQ1ZjYwOGM="
//        var headers: HTTPHeaders = [:]
//        headers["Authorization"] = securityToken
//        let parameters: Parameters = ["city": airportCode, "minutesBehind" : minutesBehind, "miutesAhead" :minutesAhead]
//                Alamofire.request("https://api.qa.alaskaair.com/1/airports/"+airportCode+"/flights/flightInfo", parameters: parameters, headers: headers).responseJSON { (response) in
//                    switch response.result {
//                    case .success:
//                        if let json = response.result.value {
//                            self.data = [String: AnyObject]();
//                            if let dict = json as? [String: AnyObject]{
//                                // Dictionary found
//                                self.data = dict;
//                            }
//                            else if let list = json as? [AnyObject] {
//                                // Array found
//                                self.data = ["data":list as AnyObject];
//                            }
//                        }
//                    case .failure(let error):
//                        print("status code: \(error.localizedDescription)")
//                        let alert = UIAlertController(title: "Error", message: "Something went wrong. Please try again later!", preferredStyle: .alert)
//                                                alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
//                                                UIApplication.shared.keyWindow?.rootViewController?.present(alert, animated: true, completion: nil)
//                    }
//                }
//        return self.data
//  }
    
    
}
