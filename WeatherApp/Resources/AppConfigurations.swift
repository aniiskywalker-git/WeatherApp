//
//  Constants.swift
//  WeatherApp
//
//  Created by Ana Victoria Frias on 07/09/23.
//

import Foundation


final class AppConfigurations {
    lazy var apiBaseURL: String = {
        guard let apiBaseURL = Bundle.main.object(forInfoDictionaryKey: "ApiBaseUrl") as? String else {
            fatalError("ApiBaseURL must not be empty in plist")
        }
        return apiBaseURL
    }()
    
    var requestApi: String =  {
        return "/forecast?latitude=52.52&longitude=13.41&current_weather=true"
    }()
}
