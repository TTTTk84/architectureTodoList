//
//  TodoRepository.swift
//  swift_todo
//
//  Created by tk84 on 2021/08/21.
//

import Foundation

protocol TodoDataStoreProtocol {
    func fetch(completion: ([Todo]) -> Void)

    func add(todo: Todo, completion: ([Todo]) -> Void)
}


class TodoDataStore {

    var tempTodoArray: [Todo] = [
        Todo(name: "task 1"),
        Todo(name: "task 2"),
        Todo(name: "task 3"),
        Todo(name: "task 4"),
        Todo(name: "task 5")
    ]

    init(){
    }

}

extension TodoDataStore: TodoDataStoreProtocol {



    func fetch(completion: ([Todo]) -> Void) {
        completion(self.tempTodoArray)
    }

    func add(todo: Todo, completion: ([Todo]) -> Void) {
        self.tempTodoArray.append(todo)
        completion(tempTodoArray)
    }


}
