//
//  CurrentWeather.swift
//  weatherPi_iOS
//
//  Created by Jonas Sunnari on 2017-05-23.
//  Copyright © 2017 Jonas Sunnari. All rights reserved.
//

import SwiftyJSON

class CurrentWeather {
    var outdoorTemperature: String!
    var outdoorMinTemperature: String!
    var outdoorMaxTemperature: String!
    
    var outdoorHumidity: String!
    var outdoorMinHumidity: String!
    var outdoorMaxHumidity: String!
    
    var outdoorPressure: String!
    var outdoorMinPressure: String!
    var outdoorMaxPressure: String!
    
    var indoorTemperature: String!
    var indoorMinTemperature: String!
    var indoorMaxTemperature: String!
    
    var indoorHumidity: String!
    var indoorMinHumidity: String!
    var indoorMaxHumidity: String!
    
    var outdoorTemperatureTrend: String!
    var outdoorHumidityTrend: String!
    var outdoorPressureTrend: String!
    var indoorTemperatureTrend: String!
    var indoorHumidityTrend: String!

    func updateFromBackend(weatherData: JSON) {
        outdoorTemperature = String(weatherData["outdoorTemp"].doubleValue) + "°C"
        outdoorMinTemperature = String(weatherData["outdoorMinTemp"].doubleValue) + "°C"
        outdoorMaxTemperature = String(weatherData["outdoorMaxTemp"].doubleValue) + "°C"

        outdoorHumidity = String(format: "%.0f", weatherData["outdoorHum"].doubleValue) + "%"
        outdoorMinHumidity = String(format: "%.0f", weatherData["outdoorMinHum"].doubleValue) + "%"
        outdoorMaxHumidity = String(format: "%.0f", weatherData["outdoorMaxHum"].doubleValue) + "%"

        outdoorPressure = String(format: "%.0f", weatherData["outdoorPressure"].doubleValue) + "hPa"
        outdoorMinPressure = String(format: "%.0f", weatherData["outdoorMinPressure"].doubleValue) + "hPa"
        outdoorMaxPressure = String(format: "%.0f", weatherData["outdoorMaxPressure"].doubleValue) + "hPa"

        indoorTemperature = String(weatherData["indoorTemp"].doubleValue) + "°C"
        indoorMinTemperature = String(weatherData["indoorMinTemp"].doubleValue) + "°C"
        indoorMaxTemperature = String(weatherData["indoorMaxTemp"].doubleValue) + "°C"

        indoorHumidity = String(format: "%.0f", weatherData["indoorHum"].doubleValue) + "%"
        indoorMinHumidity = String(format: "%.0f", weatherData["indoorMinHum"].doubleValue) + "%"
        indoorMaxHumidity = String(format: "%.0f", weatherData["indoorMaxHum"].doubleValue) + "%"

        outdoorTemperatureTrend = weatherData["outdoorTempTrend"].stringValue
        outdoorHumidityTrend = weatherData["outdoorHumTrend"].stringValue
        outdoorPressureTrend = weatherData["outdoorPressureTrend"].stringValue
        indoorTemperatureTrend = weatherData["indoorTempTrend"].stringValue
        indoorHumidityTrend = weatherData["indoorHumTrend"].stringValue
    }
}
