//
//  ViewController.swift
//  weatherPi_iOS
//
//  Created by Jonas Sunnari on 2017-05-22.
//  Copyright © 2017 Jonas Sunnari. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let currentWeatherView: CurrentWeatherView = CurrentWeatherView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(currentWeatherView)
        setupCurrentWeatherViewConstraints()
        
        let gradient: CAGradientLayer = CAGradientLayer()
        //TODO: Set colors as constants
        gradient.colors = [UIColor(red:0.03, green:0.34, blue:0.36, alpha:1.0).cgColor, UIColor(red:0.00, green:0.23, blue:0.27, alpha:1.0).cgColor]
        gradient.frame = view.bounds
        view.layer.insertSublayer(gradient, at: 0)
        
        setNavigationTitle()

        BackendCommunicator.getCurrentWeather(success: { responseJSON in
            self.currentWeatherView.setCurrentvalues(weather: responseJSON)
        }, failure: { error in
            Logger.debug("show error in ui")
        })

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

}

