//
//  ViewController.swift
//  09Debugging
//
//  Created by Erik Uecke on 4/6/17.
//  Copyright © 2017 Erik Uecke. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func buttonTapped(_ sender: UIButton) {
        print("Method: \(#function) in file: \(#file) line: \(#line) called.")
        
        badMethod()
    }
    
    func badMethod() {
        let array = NSMutableArray()
        
        for i in 0..<10 {
            array.insert(i, at: i)
            
        }
        
        // Go one step too far emptying the array (notice the range change):
        for _ in 0...10 {
            array.remove(at: 0)
        }
        print("bad method called")
    }

}

