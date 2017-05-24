//
//  ViewController.swift
//  weatherPi_iOS
//
//  Created by Jonas Sunnari on 2017-05-22.
//  Copyright © 2017 Jonas Sunnari. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    private let currentWeather: CurrentWeather = CurrentWeather()
    private let currentWeatherView: CurrentWeatherView = CurrentWeatherView()
    private let launchScreenController = UIStoryboard(name: "LaunchScreen", bundle: nil).instantiateInitialViewController()
    private var launchScreenVisible: Bool = false
    private var refreshTimer: Timer?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(currentWeatherView)

        setBackground()
        setNavigationTitle()
        setupCurrentWeatherViewConstraints()
        fetchCurrentWeather()
        startRefreshTimer()
    }
    
    private func setBackground() {
        let gradient: CAGradientLayer = CAGradientLayer()
        gradient.colors = [UIColor.wpiTurquoise.cgColor, UIColor.wpiDarkTurquoise.cgColor]
        gradient.frame = view.bounds
        view.layer.insertSublayer(gradient, at: 0)
    }
    
    private func setNavigationTitle(){
        let titleLabel = UILabel()
        let attributes: [String : Any] = [NSFontAttributeName: UIFont(name: "OpenSans", size: 20)!, NSForegroundColorAttributeName: UIColor.white, NSKernAttributeName: 2.0]
        titleLabel.attributedText = NSAttributedString(string: "WeatherPi", attributes: attributes)
        titleLabel.sizeToFit()
        navigationItem.titleView = titleLabel
    }
    
    private func setupCurrentWeatherViewConstraints() {        
        currentWeatherView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        currentWeatherView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        currentWeatherView.topAnchor.constraint(equalTo: topLayoutGuide.bottomAnchor).isActive = true
        currentWeatherView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    
    func fetchCurrentWeather() {
        BackendCommunicator.getCurrentWeather(success: { responseJSON in
            if (self.launchScreenVisible) {
                self.launchScreenController?.dismiss(animated: true, completion: nil)
                self.launchScreenVisible = false
            }
            self.currentWeather.updateFromBackend(weatherData: responseJSON)
            self.currentWeatherView.setCurrentvalues(with: self.currentWeather)
        }, failure: { error in
            if (!self.launchScreenVisible) {
                self.present(self.launchScreenController!, animated: true, completion: nil)
                self.launchScreenVisible = true
            }
            self.stopRefreshTimer()
            let alert = UIAlertController(title: "Error", message: "Failed to fetch current weather from server, check your internet connection.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Try again", style: .default, handler: { (_) in
                self.fetchCurrentWeather()
                self.startRefreshTimer()
            }))
          
            self.launchScreenController?.present(alert, animated: true, completion: nil)
        })
    }
    
    private func startRefreshTimer() {        
        refreshTimer = Timer.scheduledTimer(timeInterval: 5, target: self, selector: #selector(fetchCurrentWeather), userInfo: nil, repeats: true)
    }
    
    private func stopRefreshTimer() {
        refreshTimer?.invalidate()
    }

}

