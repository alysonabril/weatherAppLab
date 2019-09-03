//
//  RandomUserDVC.swift
//  weatherApp
//
//  Created by Alyson Abril on 8/28/19.
//  Copyright © 2019 Alyson Abril. All rights reserved.
//

import UIKit

class RandomUserDVC: UIViewController {
    
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var dobLabel: UILabel!
    
    var users: Results!
    override func viewDidLoad() {
        super.viewDidLoad()
        uploadUserInfo()
    }
    
    private func uploadUserInfo() {
        let location = users.location
        addressLabel.text = "\(location.street); \n\(location.city), \(location.state)"
        phoneLabel.text = users.phone
        dobLabel.text = "\(users.dob)"
        
    }
    
}
