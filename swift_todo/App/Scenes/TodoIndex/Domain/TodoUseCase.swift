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




class TodoUseCase {

    var output: TodoUseCaseOutput!
    var todoGateway: TodoGatewayProtocol!
    var todoList: [Todo] = []

    init() {}

}

extension TodoUseCase: TodoUseCaseProtocol {

    func fetchAll() {
        self.todoGateway.fetch() { [weak self] todoResult in
            self?.todoList = todoResult
            self!.output.useCaseDidUpdate(todoList: todoList)
        }

    }

    func addTodoItem(sendText: String) {
        let todo = Todo(name: sendText)

        self.todoGateway.add(todo: todo) { [weak self] todoResult in
            self?.todoList = todoResult
            self!.output.useCaseDidUpdate(todoList: todoList)
        }

    }

}
