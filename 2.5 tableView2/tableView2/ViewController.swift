//
//  ViewController.swift
//  tableView2
//
//  Created by Joan Cabezas on 8/31/19.
//  Copyright © 2019 josancamon19. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    let names : [String] = ["Joan Cabezas", "Sandra Monroy", "Nicolas Cabezas"]
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "TVCell")
        
        
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(String(names.count))
        return names.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TVCell", for: indexPath) as!  TableViewCell
        cell.lblName.text = names[indexPath.row]
        return cell
    }
  
}

