//
//  Weather.swift
//  weatherApp
//
//  Created by Alyson Abril on 8/28/19.
//  Copyright © 2019 Alyson Abril. All rights reserved.
//

import UIKit

struct ListInfo: Codable {
    
    struct Weather: Codable {
        let list: [ListInfo]
        
        static func getWeather(from data: Data) throws -> [ListInfo] {
            do {
                let weatherInfo = try JSONDecoder().decode(ListInfo.Weather.self, from: data)
                return  weatherInfo.list
            } catch {
                throw JSONError.decodingError(error)
            }
        }
    }
    
    let name: String
    let main: MainInfo
    let weather: [WeatherInfo]
    
    //if we want to call this struct MainInfo alone, we would not be able to, because it  only  exists inside the ListInfo scope
    struct MainInfo: Codable {
        let temp: Double
    }
    
    struct WeatherInfo: Codable {
        let description: String
    }
}
