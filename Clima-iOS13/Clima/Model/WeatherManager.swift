//
//  WeatherManager.swift
//  Clima
//
//  Created by Alex Waldron on 10/20/20.
//  Copyright © 2020 App Brewery. All rights reserved.
//

import Foundation
import CoreLocation
protocol WeatherManagerDelegate {
    func didUpdateWeather(_ weatherManager: WeatherManager, weather: WeatherModel )
    func didFailWithError(error: Error)
}

struct WeatherManager{
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?appid=c685baba8c86cf68bc7f38b329dd5cd4&units=imperial"
    var delegate: WeatherManagerDelegate?
    func fetchWeather(cityName: String) {
        let urlString = "\(weatherURL)&q=\(cityName)"
        print(urlString)
        performRequest(with: urlString)

    }
    func fetchWeather(lattitude: CLLocationDegrees, longitude: CLLocationDegrees){
        let stringUrl = "\(weatherURL)&lat=\(lattitude)&lon=\(longitude)"
        performRequest(with: stringUrl)
    }
    
    func performRequest(with urlString: String){
        //create url
        if let url = URL(string: urlString) {
            //create url sessiom
            let session = URLSession(configuration: .default)
            
            //give session a task
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    self.delegate?.didFailWithError(error: error!)
                    print("Error was not nil")
                    print(error!)
                    return
                }
                
                if let safeData = data {
                    
                    if let weather = self.parseJSON(safeData){
                        self.delegate?.didUpdateWeather(self, weather: weather)
                    }
                } 
            }
            
            //start the task
            task.resume()
        }
    }
    
    func parseJSON(_ weatherData: Data) -> WeatherModel?{
        //add decoder here
        let decoder = JSONDecoder()
        do{
            let decodedData = try decoder.decode(WeatherData.self, from: weatherData)
            let temp = decodedData.main.temp
            let id = decodedData.weather[0].id
            let name = decodedData.name
            
            let weather = WeatherModel(temp: temp, id: id, cityName: name)
            
            print(weather.conditionName)
            return weather
            
        } catch{
            print("unable to read weather data")
            print(error)
            delegate?.didFailWithError(error: error)
            do{
                let errorData = try decoder.decode(ErrorData.self, from: weatherData)
                print("\(errorData.cod): \(errorData.message)")
            } catch{
                print("Unable to read error data")
            }
            return nil
        }
    }
    

    
}
