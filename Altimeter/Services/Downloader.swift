//
//  Downloader.swift
//  Altimeter
//
//  Created by Ilya Virnik on 29/10/2018.
//  Copyright © 2018 Ilya Virnik. All rights reserved.
//

import UIKit

enum Downloader {
    
    static func setWeather(latitude: Double, longtitude: Double, completion: @escaping ((dayTime: String, temp: Double))->()) {
        let base = "https://api.openweathermap.org/data/2.5/weather?lat=\(latitude)&lon=\(longtitude)&APPID="
        var weather = (condition: "", temp: 0.0)
        
        guard let url = URL(string: "\(base)\(Const.apiKey)") else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else { return }
            do {
                let decoder = JSONDecoder()
                let weatherData = try decoder.decode(Base.self, from: data)
                
                guard let condition = weatherData.weather?.first?.condition, let temp = weatherData.main?.temp else { return }
                weather = (condition: condition, temp: temp)
            } catch let error {
                print("Error: \(error.localizedDescription)")
            }
            completion((dayTime: weather.condition + Day.time.rawValue.capitalized, temp: weather.temp))
            }.resume()
    }
}
