//
//  Item.swift
//  Todoey
//
//  Created by Joan Cabezas on 9/2/19.
//  Copyright © 2019 josancamon19. All rights reserved.
//

import Foundation
import RealmSwift

class Item: Object {
    @objc dynamic var title : String = ""
    @objc dynamic var done : Bool = false
    @objc dynamic var dateCreated : Date?
    var parentCategory = LinkingObjects(fromType: Category.self, property: "items")
}
