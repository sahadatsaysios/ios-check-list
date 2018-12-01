//
//  AddItemTableViewController.swift
//  CheckList
//
//  Created by Sahadat  Hossain on 1/12/18.
//  Copyright © 2018 Sahadat  Hossain. All rights reserved.
//

import UIKit

class AddItemTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.navigationBar.prefersLargeTitles = false
    }
    
    @IBAction func cancel () {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func done () {
        navigationController?.popViewController(animated: true)
    }

}
