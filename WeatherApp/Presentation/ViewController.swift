//
//  ViewController.swift
//  WeatherApp
//
//  Created by Ana Victoria Frias on 07/09/23.
//

import UIKit

class ViewController: UIViewController {
    //MARK: - Outlets
    
    @IBOutlet weak var temperatureValue: UILabel!
    @IBOutlet weak var windSpeedValue: UILabel!
    @IBOutlet weak var lastUpdatedValue: UILabel!
    
    private var viewModel = ViewModel()
    
    private let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm"
        formatter.calendar = Calendar(identifier: .iso8601)
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        formatter.locale = Locale(identifier: "en_US_POSIX")
        return formatter
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let alert = UIAlertController(title: nil, message: "Please wait...", preferredStyle: .alert)

        let loadingIndicator = UIActivityIndicatorView(frame: CGRect(x: 10, y: 5, width: 50, height: 50))
        loadingIndicator.hidesWhenStopped = true
        loadingIndicator.style = UIActivityIndicatorView.Style.medium
        loadingIndicator.startAnimating();

        alert.view.addSubview(loadingIndicator)
        
        
        viewModel.didGetInfo { [weak self] object in
            DispatchQueue.main.async {
                self?.present(alert, animated: true, completion: {
                    self?.temperatureValue.text = String(object.temperature)
                    self?.windSpeedValue.text = String(object.windSpeed)
                    let formatter = self?.dateFormatter.date(from: object.lastUpdated)
                    self?.lastUpdatedValue.text = formatter?.formatted()
                })
                
                self?.dismiss(animated: true)
            }
        }
    }
}

