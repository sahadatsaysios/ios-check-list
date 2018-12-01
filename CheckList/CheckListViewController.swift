//
//  ViewController.swift
//  CheckList
//
//  Created by Sahadat  Hossain on 30/11/18.
//  Copyright © 2018 Sahadat  Hossain. All rights reserved.
//

import UIKit

class CheckListViewController: UITableViewController {
    
    var items : [CheckListItem]

    
    required init?(coder aDecoder: NSCoder) {
        items = [CheckListItem]()
        
        let row0Item = CheckListItem()
        row0Item.checked = false
        row0Item.text = "Complete my home work"
        items.append(row0Item)
        
        let row1Item = CheckListItem()
        row1Item.text = "iOS Practice"
        row1Item.checked = false
        items.append(row1Item)
        
        let row2Item = CheckListItem()
        row2Item.text = "Android Practice time"
        row2Item.checked = false
        items.append(row2Item)
        
        let row3Item = CheckListItem()
        row3Item.text = "Node.js Practice time"
        row3Item.checked = false
        items.append(row3Item)
        
        let row4Item = CheckListItem()
        row4Item.text = "PHP Framekwork Laravel Practice"
        row4Item.checked = false
        items.append(row4Item)
        
        let row5Item = CheckListItem()
        row5Item.text = "Relax time"
        row5Item.checked = false
        items.append(row5Item)
        
        let row6Item = CheckListItem()
        row6Item.text = "Learn Machine Learning"
        row6Item.checked = false
        items.append(row6Item)
        
        let row7Item = CheckListItem()
        row7Item.text = "learning Artificial Inteligence"
        row7Item.checked = false
        items.append(row7Item)
        
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    @IBAction func addItem(_ sender: Any) {
        let newRowIndex = items.count
        
        let item = CheckListItem()
        item.text = "I am new Row"
        item.checked = false
        
        items.append(item)
        
        let indexPath = IndexPath(row: newRowIndex, section: 0)
        let indexPaths = [indexPath]
        tableView.insertRows(at: indexPaths, with: .automatic)
    }
    

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CheckListItem", for: indexPath)
        let item = items[indexPath.row] // extract item
        configText(withTextCell: cell, and: item) // config textlable view
        configCheckmarks(for: cell, with: item) // config checkmark control
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) {
            let item = items[indexPath.row]
            item.toggoleChecked() // if true then assigne false. if false then assign true
            configCheckmarks(for: cell, with: item)
        }
       
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func configCheckmarks (for cell : UITableViewCell, with item : CheckListItem) {
        if item.checked {
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }
    }
    
    func configText (withTextCell cell: UITableViewCell, and item: CheckListItem) {
        let label = cell.viewWithTag(1000) as! UILabel
        label.text = item.text
    }

}

