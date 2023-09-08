//
//  CurrentWeather.swift
//  WeatherApp
//
//  Created by Ana Victoria Frias on 07/09/23.
//

import Foundation

/// JSON:
// "current_weather":{"temperature":17.4,"windspeed":7.4,"winddirection":104,"weathercode":0,"is_day":0,"time":"2023-09-07T23:00"}



struct CurrentWeather {
    
    var temperature: Double
    var windSpeed: Double
    var lastUpdated: String
    
    private enum ContainerKey: String, CodingKey {
        case currentWeather = "current_weather"
    }
    
    private enum CodingKeys: String, CodingKey {
        case temperature
        case windSpeed = "windspeed"
        case lastUpdated = "time"
    }

}

extension CurrentWeather: Decodable {
    init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: ContainerKey.self)
        let subcontainer = try container.nestedContainer(keyedBy: CodingKeys.self, forKey: .currentWeather)
        temperature = try subcontainer.decode(Double.self, forKey: .temperature)
        windSpeed = try subcontainer.decode(Double.self, forKey: .windSpeed)
        lastUpdated = try subcontainer.decode(String.self, forKey: .lastUpdated)
    }
    
}
