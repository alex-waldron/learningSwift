//
//  WeatherManager.swift
//  Clima
//
//  Created by Alex Waldron on 10/20/20.
//  Copyright © 2020 App Brewery. All rights reserved.
//

import Foundation
struct WeatherManager{
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?appid=c685baba8c86cf68bc7f38b329dd5cd4&units=imperial"
    func fetchWeather(cityName: String) {
        let urlString = "\(weatherURL)&q=\(cityName)"
        print(urlString)
        performRequest(urlString: urlString)
    }
    
    func performRequest(urlString: String){
        //create url
        if let url = URL(string: urlString) {
            //create url sessiom
            let session = URLSession(configuration: .default)
            
            //give session a task
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    print("Error was not nil")
                    print(error!)
                    return
                }
                
                if let safeData = data {
                    self.parseJSON(weatherData: safeData)
                } 
            }
            
            //start the task
            task.resume()
        }
    }
    
    func parseJSON(weatherData: Data){
        //add decoder here
        let decoder = JSONDecoder()
        do{
            let decodedData = try decoder.decode(WeatherData.self, from: weatherData)
            print(decodedData.main.temp)
            print(decodedData.weather[0].description)
        } catch{ error
            print("unable to read weather data")
            print(error)
            do{
                let errorData = try decoder.decode(ErrorData.self, from: weatherData)
                print("\(errorData.cod): \(errorData.message)")
            } catch{
                print("Unable to read error data")
            }
        }
        
    }
}
