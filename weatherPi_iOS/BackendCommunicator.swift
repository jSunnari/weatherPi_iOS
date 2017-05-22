//
//  BackendCommunicator.swift
//  weatherPi_iOS
//
//  Created by Jonas Sunnari on 2017-05-22.
//  Copyright © 2017 Jonas Sunnari. All rights reserved.
//

import Alamofire
import SwiftyBeaver

class BackendCommunicator: NSObject {
    
    private static let baseUrl : URL! = URL(string: baseHostUrl)
    private static let currentWeatherEndpoint: String = "api/weather/current"
    
    static func getCurrentWeather() {
        guard let requestUrl = URL(string: currentWeatherEndpoint, relativeTo: baseUrl) else {
            Logger.error("Failed to create requestUrl")
            return
        }
        
        Alamofire.request(requestUrl, method: .get).validate().responseJSON { response in
            switch response.result {
            case .success(let value):
                Logger.info(value)
                
            case .failure(let error):
                Logger.error("Failed to get current weather, \(error)")
            }
        }
    }
    
    
}
