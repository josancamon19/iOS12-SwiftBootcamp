//
//  TableViewCell.swift
//  tableView
//
//  Created by Joan Cabezas on 8/31/19.
//  Copyright © 2019 josancamon19. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var ivEmployeePhoto: UIImageView!
    @IBOutlet weak var ivEmployeeName: UILabel!
    @IBOutlet weak var ivEmployeePosition: UILabel!
    
    var employee : Employee? = nil
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
       
        ivEmployeeName.text = employee?.name
        ivEmployeePosition.text = employee?.position
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
