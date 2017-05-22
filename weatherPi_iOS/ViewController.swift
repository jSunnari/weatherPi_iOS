//
//  ViewController.swift
//  weatherPi_iOS
//
//  Created by Jonas Sunnari on 2017-05-22.
//  Copyright © 2017 Jonas Sunnari. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let currentWeatherView: CurrentWeatherView = CurrentWeatherView(frame: view.frame)
        
        view.addSubview(currentWeatherView)
        
        let gradient: CAGradientLayer = CAGradientLayer()
        
        //TODO: Set colors as constants
        gradient.colors = [UIColor(red:0.03, green:0.34, blue:0.36, alpha:1.0).cgColor, UIColor(red:0.00, green:0.23, blue:0.27, alpha:1.0).cgColor]
        gradient.frame = view.bounds

        //gradient.locations = [0.0, 1.0]
        //gradient.startPoint = CGPoint(x: 0.0, y: 0.0)
        //gradient.endPoint = CGPoint(x: 1.0, y: 1.0)

        view.layer.insertSublayer(gradient, at: 0)
        
        
        let titleLabel = UILabel()
        let attributes: [String : Any] = [NSFontAttributeName: UIFont(name: "OpenSans", size: 20)!, NSForegroundColorAttributeName: UIColor.white, NSKernAttributeName: 2.0]
        titleLabel.attributedText = NSAttributedString(string: "WeatherPi", attributes: attributes)
        titleLabel.sizeToFit()
        navigationItem.titleView = titleLabel
        
        BackendCommunicator.getCurrentWeather()

    }

}

