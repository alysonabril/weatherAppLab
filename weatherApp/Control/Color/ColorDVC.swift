//
//  ColorDVC.swift
//  weatherApp
//
//  Created by Alyson Abril on 8/28/19.
//  Copyright © 2019 Alyson Abril. All rights reserved.
//

import UIKit

class ColorDVC: UIViewController {

    @IBOutlet weak var hexLabel: UILabel!
    @IBOutlet weak var rgbLabel: UILabel!
    
    var color: Color!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateDVCLabels()
    }
    
    private func updateDVCLabels() {
        let rgb = color.rgb
        hexLabel.text = "Hex: \(color.hex.value)"
        rgbLabel.text = "RGB r: \(rgb.r) g: \(rgb.g) b: \(rgb.b)"
    }

    

}
