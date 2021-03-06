//
//  ConversionViewController.swift
//  03WorldTrotter
//
//  Created by Erik Uecke on 3/28/17.
//  Copyright © 2017 Erik Uecke. All rights reserved.
//

import UIKit

class ConversionViewController: UIViewController, UITextFieldDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("ConversionViewController loaded its view.")
        
        updateCelsiusLabel()
    }
    
    @IBOutlet var celsiusLabel: UILabel!
    var fahrenheitValue: Measurement<UnitTemperature>? {
        didSet {
            updateCelsiusLabel()
        }
    }
    
    var celsiusValue: Measurement<UnitTemperature>? {
        if let fahrenheitValue = fahrenheitValue {
            return fahrenheitValue.converted(to: .celsius)
        } else {
            return nil
        }
    }
    
    @IBOutlet var textField: UITextField!
    
    @IBAction func fahrenheitFieldEditingChanged(_ textField: UITextField) {
        
        if let text = textField.text, let number = numberFormatter.number(from: text) {
            fahrenheitValue = Measurement(value: number.doubleValue, unit: .fahrenheit) 
        } else {
            fahrenheitValue = nil
        }
    }
    
    @IBAction func dismissKeyBoard(_ sender: UITapGestureRecognizer) {
        textField.resignFirstResponder()
    }
    
    // Updats celcius value
    func updateCelsiusLabel() {
        if let celsiusValue = celsiusValue {
            celsiusLabel.text = numberFormatter.string(from: NSNumber(value: celsiusValue.value))
        } else {
            celsiusLabel.text = "???"
        }
    }
    
    // Number Formatters
    let numberFormatter: NumberFormatter = {
        let nf = NumberFormatter()
        nf.numberStyle = .decimal
        nf.minimumFractionDigits = 0
        nf.maximumFractionDigits = 1
        return nf
    }()
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        let currentLocale = Locale.current
        let decimalSeparator = currentLocale.decimalSeparator ?? "."
        
        let existingTextHasDecimalSeparator = textField.text?.range(of: decimalSeparator)
        let replacementTextHasDecimalSeparator = string.range(of: decimalSeparator)
        
        var validTextFieldInput = NSCharacterSet.decimalDigits // Create range withonly decimal digits
        validTextFieldInput.insert(".") // Add the decimal character (in case using keyboard?)
        
        // Create test variable for replacement text against valid input range
        let replacementTextIsOnlyNumbers = string.rangeOfCharacter(from: validTextFieldInput)
        
        
        
        if string == "" { // If valid number or baspace
            return true
        } else {
            if replacementTextIsOnlyNumbers != nil {
                if existingTextHasDecimalSeparator != nil, replacementTextHasDecimalSeparator != nil {
                    return false
                }
                return true
            }
            return false
        }
    }
}























