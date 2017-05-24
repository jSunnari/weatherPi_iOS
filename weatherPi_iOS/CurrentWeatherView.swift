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
        let outdoorTemperature = String(weather["outdoorTemp"].doubleValue) + "°C"
        let outdoorMinTemperature = String(weather["outdoorMinTemp"].doubleValue) + "°C"
        let outdoorMaxTemperature = String(weather["outdoorMaxTemp"].doubleValue) + "°C"

        let outdoorHumidity = String(format: "%.0f", weather["outdoorHum"].doubleValue) + "%"
        let outdoorMinHumidity = String(format: "%.0f", weather["outdoorMinHum"].doubleValue) + "%"
        let outdoorMaxHumidity = String(format: "%.0f", weather["outdoorMaxHum"].doubleValue) + "%"

        let outdoorPressure = String(format: "%.0f", weather["outdoorPressure"].doubleValue) + "hPa"
        let outdoorMinPressure = String(format: "%.0f", weather["outdoorMinPressure"].doubleValue) + "hPa"
        let outdoorMaxPressure = String(format: "%.0f", weather["outdoorMaxPressure"].doubleValue) + "hPa"

        let indoorTemperature = String(weather["indoorTemp"].doubleValue) + "°C"
        let indoorMinTemperature = String(weather["indoorMinTemp"].doubleValue) + "°C"
        let indoorMaxTemperature = String(weather["indoorMaxTemp"].doubleValue) + "°C"

        let indoorHumidity = String(format: "%.0f", weather["indoorHum"].doubleValue) + "%"
        let indoorMinHumidity = String(format: "%.0f", weather["indoorMinHum"].doubleValue) + "%"
        let indoorMaxHumidity = String(format: "%.0f", weather["indoorMaxHum"].doubleValue) + "%"

        outdoorTemperatureView.setCurrentvalueLabel(text: outdoorTemperature)
        outdoorTemperatureView.setMinValueLabel(text: outdoorMinTemperature)
        outdoorTemperatureView.setMaxValueLabel(text: outdoorMaxTemperature)
        
        outdoorHumidityView.setCurrentvalueLabel(text: outdoorHumidity)
        outdoorHumidityView.setMinValueLabel(text: outdoorMinHumidity)
        outdoorHumidityView.setMaxValueLabel(text: outdoorMaxHumidity)

        outdoorPressureView.setCurrentvalueLabel(text: outdoorPressure)
        outdoorPressureView.setMinValueLabel(text: outdoorMinPressure)
        outdoorPressureView.setMaxValueLabel(text: outdoorMaxPressure)

        indoorTemperatureView.setCurrentvalueLabel(text: indoorTemperature)
        indoorTemperatureView.setMinValueLabel(text: indoorMinTemperature)
        indoorTemperatureView.setMaxValueLabel(text: indoorMaxTemperature)

        indoorHumidityView.setCurrentvalueLabel(text: indoorHumidity)
        indoorHumidityView.setMinValueLabel(text: indoorMinHumidity)
        indoorHumidityView.setMaxValueLabel(text: indoorMaxHumidity)
        
    }
    
}
