//
//  TableViewCell.swift
//  tableView2
//
//  Created by Joan Cabezas on 8/31/19.
//  Copyright © 2019 josancamon19. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var lblName: UILabel!
    var userName : String = ""
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        lblName.text = userName
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
