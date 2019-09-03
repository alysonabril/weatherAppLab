//
//  RandomUserViewController.swift
//  weatherApp
//
//  Created by Alyson Abril on 8/28/19.
//  Copyright © 2019 Alyson Abril. All rights reserved.
//

import UIKit

class RandomUserViewController: UIViewController {
    
    @IBOutlet weak var randomUserTableView: UITableView!
    
    var randomUsers = [Results]() {
        didSet {
            randomUserTableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        loadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destination = segue.destination as? RandomUserDVC,
            let indexPath = randomUserTableView.indexPathForSelectedRow else {return}
        let selectedUser = randomUsers[indexPath.row]
        destination.users = selectedUser
    }
    
    private func configureTableView() {
        randomUserTableView.delegate = self
        randomUserTableView.dataSource = self
    }
    
    private func loadData() {
        guard let pathToData = Bundle.main.path(forResource: "randomUser", ofType: "json") else {fatalError("randomUser.json file not found")}
        let internalUrl = URL(fileURLWithPath: pathToData)
        do {
            let data = try Data(contentsOf: internalUrl)
            let usersFroMJSON = try RandomUser.getUser(from: data)
            randomUsers = usersFroMJSON
        } catch {
            fatalError("an error occured: \(error)")
        }
    }
}

extension RandomUserViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return randomUsers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let user = randomUsers[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "userCell", for: indexPath)
        cell.textLabel?.text = "\(user.name.last), \(user.name.first)"
        cell.detailTextLabel?.text = user.email
        return cell
    }
    
    
}
