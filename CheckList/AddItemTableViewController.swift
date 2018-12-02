//
//  AddItemTableViewController.swift
//  CheckList
//
//  Created by Sahadat  Hossain on 1/12/18.
//  Copyright © 2018 Sahadat  Hossain. All rights reserved.
//

import UIKit

protocol AddItemViewControllerDelegate : class {
    
    func addItemControllerDidCancel (_ controller : AddItemTableViewController)
    func addItemControllerDone (_ controller : AddItemTableViewController, didFinishAdding item: CheckListItem)
}


class AddItemTableViewController: UITableViewController, UITextFieldDelegate {

    @IBOutlet weak var textField: UITextField!
    
    var itemToEdit : CheckListItem?
    
    
    weak var delegate : AddItemViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.largeTitleDisplayMode = .never
        textField.delegate = self
        
        if let item = itemToEdit {
            title = "Edit Item"
            textField.text = item.text
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        textField.becomeFirstResponder()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        
        return false
    }
    
    @IBAction func cancel () {
        navigationController?.popViewController(animated: true)
        
       delegate?.addItemControllerDidCancel(self)
    }
    
    @IBAction func done () {
        navigationController?.popViewController(animated: true)
        let item = CheckListItem()
        item.text = textField.text!
        item.checked = false
        
        delegate?.addItemControllerDone(self, didFinishAdding: item)
    }
    
    override func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        return nil
    }

}
