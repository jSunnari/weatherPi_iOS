//
//  CurrentWeatherView.swift
//  WeatherPi-iOS
//
//  Created by Jonas Sunnari on 2017-05-22.
//  Copyright © 2017 sunnari. All rights reserved.
//

import UIKit

class CurrentWeatherView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let testLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 16)
        label.text = "testing"
        return label
    }()
    
    func setupView() {
        let gradient: CAGradientLayer = CAGradientLayer()
        gradient.frame = bounds
        //TODO: Set colors as constants
        gradient.colors = [UIColor(red:0.00, green:0.23, blue:0.27, alpha:1.0), UIColor(red:0.03, green:0.34, blue:0.36, alpha:1.0), UIColor(red:0.00, green:0.23, blue:0.27, alpha:1.0)]
        
        layer.insertSublayer(gradient, at: 0)
   
        
        addSubview(testLabel)
        backgroundColor = UIColor.white
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": testLabel]))
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": testLabel]))
        
    }
    
}
