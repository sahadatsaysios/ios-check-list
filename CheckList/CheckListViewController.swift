//
//  ViewController.swift
//  CheckList
//
//  Created by Sahadat  Hossain on 30/11/18.
//  Copyright © 2018 Sahadat  Hossain. All rights reserved.
//

import UIKit

class CheckListViewController: UITableViewController {
    var works = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        works = ["Brush my Teeth", "Complete my home work", "Pranctice iOS", "Practice Android", "Practices Node.js"]
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return works.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CheckListItem", for: indexPath)
        let label = cell.viewWithTag(1000) as! UILabel
        label.text = works[indexPath.row]
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let cell = tableView.cellForRow(at: indexPath) {
            if cell.accessoryType == .none {
                cell.accessoryType = .checkmark
            } else {
                cell.accessoryType = .none
            }
        }
        
        tableView.deselectRow(at: indexPath, animated: true)
        
    }

}

