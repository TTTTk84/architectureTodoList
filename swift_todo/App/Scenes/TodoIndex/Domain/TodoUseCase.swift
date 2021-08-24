//
//  TodoListUseCase.swift
//  swift_todo
//
//  Created by tk84 on 2021/08/21.
//

import Foundation


protocol TodoUseCaseProtocol: AnyObject {
    func fetchAll()
    func addTodoItem(sendText: String)

    var output: TodoUseCaseOutput! { get set }
}

protocol TodoUseCaseOutput {
    func useCaseDidUpdate(todoList: [Todo])
}

protocol TodoGatewayProtocol {
    func fetch() -> [Todo]
    func add(todo: Todo)
}


class TodoUseCase {
    private var tempTodoArray: [Todo] = [
        Todo(name: "task 1"),
        Todo(name: "task 2"),
        Todo(name: "task 3"),
        Todo(name: "task 4")
    ]

    var output: TodoUseCaseOutput!

    var todoGateway: TodoGatewayProtocol

    init() {}

}

extension TodoUseCase: TodoUseCaseProtocol {

    func fetchAll() {
        self.output.useCaseDidUpdate(todoList: self.tempTodoArray)
    }

    func addTodoItem(sendText: String) {

    }

}
