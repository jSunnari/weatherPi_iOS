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

    private let outdoorTemperatureView: Value = Value()
    private let outdoorHumidityView: Value = Value()
    private let outdoorPressureView: Value = Value()
    private let indoorTemperatureView: Value = Value()
    private let indoorHumidityView: Value = Value()

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
        
        outdoorTemperatureView.setValueIcon(valueIcon: #imageLiteral(resourceName: "wea-temperature"))
        outdoorHumidityView.setValueIcon(valueIcon: #imageLiteral(resourceName: "wea-humidity"))
        outdoorPressureView.setValueIcon(valueIcon: #imageLiteral(resourceName: "wea-pressure"))
        indoorTemperatureView.setValueIcon(valueIcon: #imageLiteral(resourceName: "wea-temperature"))
        indoorHumidityView.setValueIcon(valueIcon: #imageLiteral(resourceName: "wea-humidity"))
        
        addArrangedSubview(outdoorHeaderView)
        addArrangedSubview(outdoorTemperatureView)
        addArrangedSubview(outdoorHumidityView)
        addArrangedSubview(outdoorPressureView)
        addArrangedSubview(indoorHeaderView)
        addArrangedSubview(indoorTemperatureView)
        addArrangedSubview(indoorHumidityView)
    }
    
    func setCurrentvalues(with currentWeather: CurrentWeather) {
        outdoorTemperatureView.setCurrentvalueLabel(text: currentWeather.outdoorTemperature)
        outdoorTemperatureView.setMinValueLabel(text: currentWeather.outdoorMinTemperature)
        outdoorTemperatureView.setMaxValueLabel(text: currentWeather.outdoorMaxTemperature)
        
        outdoorHumidityView.setCurrentvalueLabel(text: currentWeather.outdoorHumidity)
        outdoorHumidityView.setMinValueLabel(text: currentWeather.outdoorMinHumidity)
        outdoorHumidityView.setMaxValueLabel(text: currentWeather.outdoorMaxHumidity)

        outdoorPressureView.setCurrentvalueLabel(text: currentWeather.outdoorPressure)
        outdoorPressureView.setMinValueLabel(text: currentWeather.outdoorMinPressure)
        outdoorPressureView.setMaxValueLabel(text: currentWeather.outdoorMaxPressure)

        indoorTemperatureView.setCurrentvalueLabel(text: currentWeather.indoorTemperature)
        indoorTemperatureView.setMinValueLabel(text: currentWeather.indoorMinTemperature)
        indoorTemperatureView.setMaxValueLabel(text: currentWeather.indoorMaxTemperature)

        indoorHumidityView.setCurrentvalueLabel(text: currentWeather.indoorHumidity)
        indoorHumidityView.setMinValueLabel(text: currentWeather.indoorMinHumidity)
        indoorHumidityView.setMaxValueLabel(text: currentWeather.indoorMaxHumidity)
        
        outdoorTemperatureView.setTrendArrow(direction: currentWeather.outdoorTemperatureTrend)
        outdoorHumidityView.setTrendArrow(direction: currentWeather.outdoorHumidityTrend)
        outdoorPressureView.setTrendArrow(direction: currentWeather.outdoorPressureTrend)
        
        indoorTemperatureView.setTrendArrow(direction: currentWeather.indoorTemperatureTrend)
        indoorHumidityView.setTrendArrow(direction: currentWeather.indoorHumidityTrend)
    }
    
}
