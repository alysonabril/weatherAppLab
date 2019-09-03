//
//  ColorViewController.swift
//  weatherApp
//
//  Created by Alyson Abril on 8/28/19.
//  Copyright © 2019 Alyson Abril. All rights reserved.
//

import UIKit

class ColorViewController: UIViewController {

    @IBOutlet weak var colorTableView: UITableView!
    
    var colors = [Color](){
        didSet {
            colorTableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        loadData()
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destination = segue.destination as? ColorDVC,
            let indexPath = colorTableView.indexPathForSelectedRow else {return}
        let selectedColor = colors[indexPath.row]
        destination.color = selectedColor
    }
    
    //private methods
    private func configureTableView() {
        colorTableView.delegate = self
        colorTableView.dataSource = self
    }
    
    private func loadData() {
        guard let pathToData = Bundle.main.path(forResource: "color", ofType: "json") else {
            fatalError("color.json file not found")
        }
        let internalUrl = URL(fileURLWithPath: pathToData)
        do{
            let data = try Data(contentsOf: internalUrl)
            let colorFromJSON = try Color.getColor(from: data)
            //we set colors to an array of colorFromJSON because in this example we KNOW that it will return 1 object
            colors = [colorFromJSON]
        } catch let jsonError {
            fatalError("An error occured: \(jsonError)")
        }
    }
}

extension ColorViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return colors.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let color = colors[indexPath.row]
        let rgb = color.rgb
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "colorCell", for: indexPath)
        cell.textLabel?.text = color.name.value
        cell.backgroundColor = UIColor(displayP3Red: CGFloat(rgb.r) / 255, green: CGFloat(rgb.g) / 255, blue: CGFloat(rgb.b) / 255, alpha: 1)
        return cell
        
    }
    
    
}
