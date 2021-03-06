//
//  ItemsViewController.swift
//  Homepwner
//
//  Created by Erik Uecke on 4/7/17.
//  Copyright © 2017 Erik Uecke. All rights reserved.
//

import UIKit

class ItemsViewController: UITableViewController {
    
    var itemStore: ItemStore!
    var imageStore: ImageStore!
    
    @IBAction func addNewItem(_ sender: UIBarButtonItem) {
        // Creat a new item and add it to the store
        let newItem = itemStore.createItem()
        
        // Fire out where that item is in the array
        if let index = itemStore.allItems.index(of: newItem) {
            let indexPath = IndexPath(row: index, section: 0)
            
            // Insert this new row into the table
            tableView.insertRows(at: [indexPath], with: .automatic)
        }
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemStore.allItems.count + 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row < itemStore.allItems.count {
            // Get a new or recycled cell
            let cell = tableView.dequeueReusableCell(withIdentifier: "ItemCell", for: indexPath) as! ItemCell
            
            // Set the text on the cell with the description of the item
            // that is at the nth indes of items, where n = row this cell
            // will appear in on the tableview
            let item = itemStore.allItems[indexPath.row]
            
            // Configure the cell with the Item
            cell.nameLabel.text = item.name
            cell.serialNumber.text = item.serialNumber
            cell.valueLabel.text = "$\(item.valueInDollars)"
            if item.valueInDollars < 50 {
                cell.valueLabel.textColor = UIColor.green
            } else {
                cell.valueLabel.textColor = UIColor.red
            }
            
            return cell
        } else {
            let cell = UITableViewCell(style: .value1, reuseIdentifier: "UITableViewCell_NMI")
            cell.textLabel?.text = "No more Items!"
            return cell
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 65
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        // If the table view is asking to commit a delete command...
        if editingStyle == .delete {
            let item = itemStore.allItems[indexPath.row]
            
            let title = "Delete \(item.name)?"
            let message = "Are you sure you want to delete this item?"
            
            let ac = UIAlertController(title: title, message: message, preferredStyle: .actionSheet)
            
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
            ac.addAction(cancelAction)
            
            let deleteAction = UIAlertAction(title: "Remove", style: .destructive, handler: { (action) -> Void in
                // Remove the item from the store
                self.itemStore.removeItem(item)
                
                // Remove the item's image from the image store
                self.imageStore.deletImage(forKey: item.itemKey)
                
                // Also remove that row from the table view with an animation
                self.tableView.deleteRows(at: [indexPath], with: .automatic)
                
            })
            ac.addAction(deleteAction)
            
            // Present the alert controller
            present(ac, animated: true, completion: nil)
        }
    }
    
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        
        // Update the model
        itemStore.moveItem(from: sourceIndexPath.row, to: destinationIndexPath.row)
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        if (indexPath.row >= itemStore.allItems.count) {
            return false
        }
        return true
    }
    
    override func tableView(_ tableView: UITableView, targetIndexPathForMoveFromRowAt sourceIndexPath: IndexPath, toProposedIndexPath proposedDestinationIndexPath: IndexPath) -> IndexPath {
        if (proposedDestinationIndexPath.row >= itemStore.allItems.count) {
            return sourceIndexPath
        }
        return proposedDestinationIndexPath
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // If the triggered seque is the "showItem" segue
        switch segue.identifier {
        case "showItem"?:
            // Figure out which row was just tapped
            if let row = tableView.indexPathForSelectedRow?.row {
                
                // Get the item associated with this row and pass it along
                let item = itemStore.allItems[row]
                let detailViewController = segue.destination as! DetailViewController
                detailViewController.item = item
                detailViewController.imageStore = imageStore
            }
        default:
            preconditionFailure("Unexpected segque identifier")
        }
    }
    
    override func viewWillAppear(_ anitmated: Bool) {
        super.viewWillAppear(anitmated)
        
        tableView.reloadData()
    }
    
    // Left bar button item
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        navigationItem.leftBarButtonItem = editButtonItem
    }
}














