//
//  ViewController.swift
//  WeatherPi-iOS
//
//  Created by Jonas Sunnari on 2017-05-22.
//  Copyright © 2017 sunnari. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let currentWeatherView: CurrentWeatherView = CurrentWeatherView(frame: view.frame)
        view.addSubview(currentWeatherView)
        
        navigationItem.title = "WeatherPi"
        
        BackendCommunicator.getCurrentWeather()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }
}

