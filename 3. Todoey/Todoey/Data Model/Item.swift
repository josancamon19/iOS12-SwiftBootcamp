//
//  Item.swift
//  Todoey
//
//  Created by Joan Cabezas on 8/31/19.
//  Copyright © 2019 josancamon19. All rights reserved.
//

import UIKit

class Item : Codable{
    var title : String = ""
    var done : Bool = false
    
    init(title : String) {
        self.title = title
        self.done = false
    }
}

