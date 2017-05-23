//
//  CurrentWeatherView.swift
//  weatherPi_iOS
//
//  Created by Jonas Sunnari on 2017-05-22.
//  Copyright © 2017 Jonas Sunnari. All rights reserved.
//

import UIKit
import SwiftyJSON

class CurrentWeatherView: UIStackView {
    private let headerHeight: CGFloat = 40.0
    private let valueHeight: CGFloat = 100.0
    
    private let outdoorHeaderView: ValueHeader = ValueHeader()
    private let indoorHeaderView: ValueHeader = ValueHeader()

    let outdoorTemperatureView: Value = Value()
    let outdoorHumidityView: Value = Value()
    let outdoorPressureView: Value = Value()
    let indoorTemperatureView: Value = Value()
    let indoorHumidityView: Value = Value()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupView() {
        translatesAutoresizingMaskIntoConstraints = false
        // Debug
        layer.borderWidth = 2
        layer.borderColor = UIColor.red.cgColor
        
        distribution = UIStackViewDistribution.fillProportionally
        axis = UILayoutConstraintAxis.vertical
        alignment = UIStackViewAlignment.fill
        
        outdoorHeaderView.setHeaderLabel(text: "OUTDOOR")
        indoorHeaderView.setHeaderLabel(text: "INDOOR")

        addArrangedSubview(outdoorHeaderView)
        addArrangedSubview(outdoorTemperatureView)
        addArrangedSubview(outdoorHumidityView)
        addArrangedSubview(outdoorPressureView)
        addArrangedSubview(indoorHeaderView)
        addArrangedSubview(indoorTemperatureView)
        addArrangedSubview(indoorHumidityView)
    }
    
    func setCurrentvalues(weather: JSON) {
        let outdoorTemperature = String(weather["outdoorTemp"].doubleValue)
        let outdoorHumidity = String(format: "%.0f", weather["outdoorHum"].doubleValue)
        let outdoorPressure = String(format: "%.0f", weather["outdoorPressure"].doubleValue)
        let indoorTemperature = String(weather["indoorTemp"].doubleValue)
        let indoorHumidity = String(format: "%.0f", weather["indoorHum"].doubleValue)
        
        
        outdoorTemperatureView.setCurrentvalueLabel(text: outdoorTemperature)
        
        outdoorHumidityView.setCurrentvalueLabel(text: outdoorHumidity)
        
        outdoorPressureView.setCurrentvalueLabel(text: outdoorPressure)
        
        indoorTemperatureView.setCurrentvalueLabel(text: indoorTemperature)
        
        indoorHumidityView.setCurrentvalueLabel(text: indoorHumidity)
        
        
    }
    
    
    private func setupHeaderConstraints() {
        outdoorHeaderView.translatesAutoresizingMaskIntoConstraints = false
        outdoorHeaderView.heightAnchor.constraint(equalToConstant: headerHeight).isActive = true
        outdoorHeaderView.widthAnchor.constraint(equalToConstant: frame.width).isActive = true
        
        indoorHeaderView.translatesAutoresizingMaskIntoConstraints = false
        indoorHeaderView.heightAnchor.constraint(equalToConstant: headerHeight).isActive = true
        indoorHeaderView.widthAnchor.constraint(equalToConstant: frame.width).isActive = true
    }
    
    private func setupValueConstraints() {
        outdoorTemperatureView.translatesAutoresizingMaskIntoConstraints = false
        outdoorTemperatureView.heightAnchor.constraint(equalToConstant: valueHeight).isActive = true
        outdoorTemperatureView.widthAnchor.constraint(equalToConstant: frame.width).isActive = true
        
        outdoorHumidityView.translatesAutoresizingMaskIntoConstraints = false
        outdoorHumidityView.heightAnchor.constraint(equalToConstant: valueHeight).isActive = true
        outdoorHumidityView.widthAnchor.constraint(equalToConstant: frame.width).isActive = true
        
        outdoorPressureView.translatesAutoresizingMaskIntoConstraints = false
        outdoorPressureView.heightAnchor.constraint(equalToConstant: valueHeight).isActive = true
        outdoorPressureView.widthAnchor.constraint(equalToConstant: frame.width).isActive = true
        
        indoorTemperatureView.translatesAutoresizingMaskIntoConstraints = false
        indoorTemperatureView.heightAnchor.constraint(equalToConstant: valueHeight).isActive = true
        indoorTemperatureView.widthAnchor.constraint(equalToConstant: frame.width).isActive = true
        
        indoorHumidityView.translatesAutoresizingMaskIntoConstraints = false
        indoorHumidityView.heightAnchor.constraint(equalToConstant: valueHeight).isActive = true
        indoorHumidityView.widthAnchor.constraint(equalToConstant: frame.width).isActive = true
    }
    
    override func layoutSubviews() {
        //setupHeaderConstraints()
        //setupValueConstraints()
    }
    
}
