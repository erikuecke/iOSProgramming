//
//  ItemCell.swift
//  Homepwner
//
//  Created by Erik Uecke on 4/11/17.
//  Copyright © 2017 Erik Uecke. All rights reserved.
//

import UIKit

class ItemCell: UITableViewCell {
    
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var serialNumber: UILabel!
    @IBOutlet var valueLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        nameLabel.adjustsFontForContentSizeCategory = true
        nameLabel.adjustsFontForContentSizeCategory = true
        nameLabel.adjustsFontForContentSizeCategory = true
        
    }
}
