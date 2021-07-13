//
//  Todo.swift
//  swift_todo
//
//  Created by tk84 on 2021/07/11.
//

import Foundation

public struct Todo: Codable {
    
    let todoId: String
    var name: String
    var isChecked: Bool
    
    init(name: String) {
        let dt = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = DateFormatter.dateFormat(fromTemplate: "yMMMdHms", options: 0, locale: Locale(identifier: "ja_JP"))
        
        self.todoId = dateFormatter.string(from: dt)
        self.name = name
        self.isChecked = false
    }
}
