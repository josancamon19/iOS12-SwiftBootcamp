//
//  ViewController.swift
//  tableView
//
//  Created by Joan Cabezas on 8/31/19.
//  Copyright © 2019 josancamon19. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    let listEmployees = [Employee(name: "Joan", position: "Android Developer"),
                         Employee(name: "Joan", position: "iOS Developer"),
                         Employee(name: "Joan", position: "FullStack Developer")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "tableViewCellEmployee")
        // tableView.reloadData()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listEmployees.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableViewCellEmployee", for: indexPath) as! TableViewCell
        cell.employee = listEmployees[indexPath.row]
        return cell
    }
    
    
    // Steps
    // 1. Create cell in new package -> new Cococa File, type -> UITableViewCell
    // 2. create design
    // 3. configure in list item controller, the respective data
    // 4. create a table view in the controller
    // 5. extend controller with UITableViewDelegate, UITableViewDataSource
    // 6. implemente methods
    // 7. return cell and manage global variable with list of stuff
    
    // Reminder -> creating a top variable in the cell like var : String = "", cannot be done
    // you must set lbl.text = something, if you set the value to a var, the var will be initiated as empty
    // and the cell wont know that then of that you setted a value, the label is already initiated as ""

}

