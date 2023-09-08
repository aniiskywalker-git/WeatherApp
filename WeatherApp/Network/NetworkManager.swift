//
//  NetworkManager.swift
//  WeatherApp
//
//  Created by Ana Victoria Frias on 07/09/23.
//

import Foundation


private protocol NetworkManagerProtocol {
    func requestData(completion: @escaping(CurrentWeather?) -> Void)
}

class NetworkManager: NetworkManagerProtocol {
    lazy var appConfigurations = AppConfigurations()
    
    func requestData(completion: @escaping (CurrentWeather?) -> Void) {
        let urlRequest = URLRequest(url: URL(string: appConfigurations.apiBaseURL + appConfigurations.requestApi)!)
        let task = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            guard let data = data else { return }
            do {
                let object = try JSONDecoder().decode(CurrentWeather.self, from: data)
                completion(object)
            } catch (let error) {
                debugPrint(error.localizedDescription)
            }
        }
        task.resume()
    }
}
