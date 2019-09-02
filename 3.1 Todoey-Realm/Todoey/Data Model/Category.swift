//
//  Category.swift
//  Todoey
//
//  Created by Joan Cabezas on 9/2/19.
//  Copyright © 2019 josancamon19. All rights reserved.
//

import Foundation
import RealmSwift

class Category: Object {
    @objc dynamic var name : String = ""
    let items = List<Item>()
}
