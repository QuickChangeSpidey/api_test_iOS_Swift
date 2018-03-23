//
//  FlightWebService.swift
//  table_view_api
//
//  Created by Akshay on 3/20/18.
//  Copyright © 2018 Akshay. All rights reserved.
//

import UIKit


class FlightWebService: NSObject {
    
    func getFlightData(for airportCode: String, minutesBehind:String, minutesAhead:String, completion: (([Flight]) -> Void)?) {
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
                    self.showError()

                } else if let jsonData = responseData {
                
                    let decoder = JSONDecoder()
                    
                    do {
                        let posts = try decoder.decode([Flight].self, from: jsonData)
                        completion?(posts)
                    } catch {
                        self.showError()

                    }
                } else {
                    let error = NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey : "Data was not retrieved from request"]) as Error
                    self.showError()
                }
            }
        }
        task.resume()
    }
    
    func showError(){
        let alertView = UIAlertController(title: "Error", message: "Something went wrong. Please try later!", preferredStyle: .alert)
        alertView.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        UIApplication.shared.keyWindow?.rootViewController?.present(alertView, animated: true, completion: nil)

    }
}
