//
//  Item.swift
//  Todoey
//
//  Created by Yos bz on 14/07/2020.
//  Copyright © 2020 Yos bz. All rights reserved.
//

import Foundation
import RealmSwift

class Item: Object {
    @objc dynamic var title: String = ""
    @objc dynamic var done: Bool = false
}

