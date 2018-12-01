//
//  ViewController.swift
//  CheckList
//
//  Created by Sahadat  Hossain on 30/11/18.
//  Copyright © 2018 Sahadat  Hossain. All rights reserved.
//

import UIKit

class CheckListViewController: UITableViewController {
    
    var items = [CheckListItem]()
    
    
    var row0Item : CheckListItem
    var row1Item : CheckListItem
    var row2Item : CheckListItem
    var row3Item : CheckListItem
    var row4Item : CheckListItem
    var row5Item : CheckListItem
    
    required init?(coder aDecoder: NSCoder) {
        
        row0Item = CheckListItem()
        row0Item.checked = false
        row0Item.text = "Complete my home work"
        
        row1Item = CheckListItem()
        row1Item.text = "iOS Practice"
        row1Item.checked = false
        
        row2Item = CheckListItem()
        row2Item.text = "Android Practice time"
        row2Item.checked = false
        
        row3Item = CheckListItem()
        row3Item.text = "Node.js Practice time"
        row3Item.checked = false
        
        row4Item = CheckListItem()
        row4Item.text = "PHP Framekwork Laravel Practice"
        row4Item.checked = false
        
        row5Item = CheckListItem()
        row5Item.text = "Relax time"
        row5Item.checked = false
        
        super.init(coder: aDecoder)
    }
    
    
    var works = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        works = ["Brush my Teeth", "Complete my home work", "Pranctice iOS", "Practice Android", "Practices Node.js"]
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CheckListItem", for: indexPath)
        let label = cell.viewWithTag(1000) as! UILabel
        
        if indexPath.row == 0 {
            label.text = row0Item.text
        } else if indexPath.row == 1 {
            label.text = row1Item.text
        } else if indexPath.row == 2 {
            label.text = row2Item.text
        } else if indexPath.row == 3 {
            label.text = row3Item.text
        } else if indexPath.row == 4 {
            label.text = row4Item.text
        } else if indexPath.row == 5 {
            label.text = row5Item.text
        }
        
        configCheckmarks(for: cell, at: indexPath)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) {
            if indexPath.row == 0 {
                row0Item.checked = !row0Item.checked
            } else if indexPath.row == 1{
                row1Item.checked = !row1Item.checked
            }else if indexPath.row == 2{
                row2Item.checked = !row2Item.checked
            }else if indexPath.row == 3{
                row3Item.checked = !row3Item.checked
            }else if indexPath.row == 4{
                row4Item.checked = !row4Item.checked
            }else if indexPath.row == 5{
                row5Item.checked = !row5Item.checked
            }
            
            configCheckmarks(for: cell, at: indexPath)
        }
       
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func configCheckmarks (for cell : UITableViewCell, at indexPath: IndexPath) {
        var isChecked = false
        
        if indexPath.row == 0 {
            isChecked = row0Item.checked
        } else if indexPath.row == 1 {
            isChecked = row1Item.checked
        } else if indexPath.row == 2 {
            isChecked = row2Item.checked
        } else if indexPath.row == 3 {
            isChecked = row3Item.checked
        } else if indexPath.row == 4 {
            isChecked = row4Item.checked
        } else if indexPath.row == 5 {
            isChecked = row5Item.checked
        }
        
        if isChecked {
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }
    
    }

}

