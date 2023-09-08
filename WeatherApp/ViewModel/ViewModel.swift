//
//  ViewModel.swift
//  WeatherApp
//
//  Created by Ana Victoria Frias on 07/09/23.
//

import Foundation


protocol ViewModelProcotol {
    func didGetInfo(completion: @escaping(CurrentWeather) -> Void)
}

class ViewModel: ViewModelProcotol {
    private let networkManager  = NetworkManager()
    
    func didGetInfo(completion: @escaping (CurrentWeather) -> Void) {
        networkManager.requestData { object in
            guard let object = object else { return }
            completion(object)
        }
    }
}

