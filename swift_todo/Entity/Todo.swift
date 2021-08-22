//
//  Todo.swift
//  swift_todo
//
//  Created by tk84 on 2021/08/21.
//

import Foundation
import RealmSwift

class Todo: Object {
    @objc dynamic var id = NSUUID().uuidString
    @objc dynamic var createAt = Date()
    @objc dynamic var name = ""

    convenience init(name: String) {
        self.init()
        self.name = name
    }
}

