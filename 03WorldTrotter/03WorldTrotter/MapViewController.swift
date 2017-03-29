//
//  MapViewController.swift
//  03WorldTrotter
//
//  Created by Erik Uecke on 3/29/17.
//  Copyright © 2017 Erik Uecke. All rights reserved.
//

import UIKit

class MapViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("MapViewController loaded its view.")
    }
    override func viewDidAppear(_ animated: Bool) {
        let date = Date()
        let hour = Calendar.current.component(.hour, from: date)
        
        if hour < 17  {
            self.view.backgroundColor = UIColor.darkGray
        }
    }
}
