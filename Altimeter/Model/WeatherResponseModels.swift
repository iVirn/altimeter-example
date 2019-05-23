//
//  WeatherResponseModels.swift
//  Altimeter
//
//  Created by Ilya Virnik on 29/10/2018.
//  Copyright © 2018 Ilya Virnik. All rights reserved.
//

import Foundation

struct Base: Codable {
    
    let weather: [Weather]?
    let main: Main?
    
    enum CodingKeys: String, CodingKey { case weather, main }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        weather = try values.decodeIfPresent([Weather].self, forKey: .weather)
        main = try values.decodeIfPresent(Main.self, forKey: .main)
    }
}

struct Weather: Codable {
    
    let condition: String?
    
    enum CodingKeys: String, CodingKey { case condition = "main" }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        condition = try values.decodeIfPresent(String.self, forKey: .condition)
    }
}

struct Main: Codable {
    
    let temp: Double?
    
    enum CodingKeys: String, CodingKey { case temp }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        temp = try values.decodeIfPresent(Double.self, forKey: .temp)
    }
}
