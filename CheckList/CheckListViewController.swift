//
//  ViewController.swift
//  CheckList
//
//  Created by Sahadat  Hossain on 30/11/18.
//  Copyright © 2018 Sahadat  Hossain. All rights reserved.
//

import UIKit

class CheckListViewController: UITableViewController, AddItemViewControllerDelegate {
    
    func addItemControllerDidCancel(_ controller: AddItemTableViewController) {
        navigationController?.popViewController(animated: true)
    }
    
    func addItemControllerDone(_ controller: AddItemTableViewController, didFinishAdding item: CheckListItem) {
    
        let newRowIndex = items.count
        
        items.append(item)
        
        let indexPath = IndexPath(item: newRowIndex, section: 0)
        let indexPaths = [indexPath]
        tableView.insertRows(at: indexPaths, with: .automatic)
 
        navigationController?.popViewController(animated: true)
    }
    
    
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AddItem" {
            let controller = segue.destination as! AddItemTableViewController
            controller.delegate = self
        } else if segue.identifier == "EditItem" {
            let controller = segue.destination as! AddItemTableViewController
            controller.delegate = self
            
            if let indexPath = tableView.indexPath(for: sender as! UITableViewCell) {
                controller.itemToEdit = items[indexPath.row]
            }
            
        }
    }
    
    @IBAction func addItem(_ sender: Any) {
        let titles = ["Nothing to do", "Need to traveling", "This is Movie Time", "This is Hanout time"]
        let randomNumber = arc4random_uniform(UInt32(titles.count))
        
        let title = titles[Int(randomNumber)]
        
        let newRowIndex = items.count
        
        let item = CheckListItem()
        item.text = title
        item.checked = true
        
        items.append(item)
        
        let indexPath = IndexPath(row: newRowIndex, section: 0)
        let indexPaths = [indexPath]
        tableView.insertRows(at: indexPaths, with: .automatic)
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        items.remove(at: indexPath.row)
        
        let indexPaths = [indexPath]
        tableView.deleteRows(at: indexPaths, with: .automatic)
        //tableView.reloadData()
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
        let label = cell.viewWithTag(1001) as! UILabel
        
        if item.checked {
            label.text = "√"
        } else {
            label.text = ""
        }
    }
    
    func configText (withTextCell cell: UITableViewCell, and item: CheckListItem) {
        let label = cell.viewWithTag(1000) as! UILabel
        label.text = item.text
    }

}

