//
//  WeatherDVC.swift
//  weatherApp
//
//  Created by Alyson Abril on 8/28/19.
//  Copyright © 2019 Alyson Abril. All rights reserved.
//

import UIKit

class WeatherDVC: UIViewController {

    @IBOutlet weak var currentTempLabel: UILabel!
    @IBOutlet weak var weatherLabel: UILabel!
    
    var list: ListInfo!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureDVC()
    }
    
    private func configureDVC () {
        currentTempLabel.text = "Current Temperature: \(list.main.temp)"
        //calling the model, we're going into the array and checking to see if anything exists inside
        //this spec api gives an array of one object in weather
        guard let weather = list.weather.first else {return}
            
        weatherLabel.text = "Current Weather: \(weather.description)"
        
    }
  

}
