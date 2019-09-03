//
//  ViewController.swift
//  weatherApp
//
//  Created by Alyson Abril on 8/28/19.
//  Copyright © 2019 Alyson Abril. All rights reserved.
//

import UIKit

class WeatherViewController: UIViewController {
    @IBOutlet weak var weatherTableView: UITableView!
    
    var cities = [ListInfo](){
        didSet {
            weatherTableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        weatherTableView.delegate = self
        weatherTableView.dataSource = self
        loadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //we guard in case there is no destination because then it will crash
        guard let destination = segue.destination as? WeatherDVC,
            let indexPath = weatherTableView.indexPathForSelectedRow else {return}
        let selectedCity = cities[indexPath.row]
        destination.list = selectedCity
    }
    
    private func loadData() {
        guard let pathToData = Bundle.main.path(forResource: "weather", ofType: "json") else {
            fatalError("weather.json file not found")
        }
        let interalUrl = URL(fileURLWithPath: pathToData)
        do {
            let data = try Data(contentsOf: interalUrl)
            let weatherFromJSON = try ListInfo.Weather.getWeather(from: data)
            cities = weatherFromJSON
        } catch {
            fatalError("An error occured: \(error)")
        }
    }
}

extension WeatherViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let city = cities[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "cityCell", for: indexPath)
        cell.textLabel?.text = city.name
        cell.detailTextLabel?.text = "temp: \(city.main.temp)"
        return cell
    }
    
    
}
