//
//  weatherModel.swift
//  Clima
//
//  Created by Alex Waldron on 10/22/20.
//  Copyright © 2020 App Brewery. All rights reserved.
//

import Foundation
struct WeatherModel{
    let temp:Double
    let id:Int
    let cityName:String
    
    var tempString:String{
        return String(format: "%.0f", temp)
    }
    
    var conditionName: String{
        switch id {
        case 801...804:
            return "cloud"
        case 800:
            return "sun.max"
        case 701...781:
            return "cloud.fog"
        case 600...622:
            return "snow"
        case 500...531:
            return "cloud.rain"
        case 300...321:
            return "cloud.drizzle"
        case 200...232:
            return "cloud.storm"
        default:
            return "id not in codes"
        }
    }
    
}
