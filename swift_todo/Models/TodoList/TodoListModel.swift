//
//  TodoListModel.swift
//  swift_todo
//
//  Created by tk84 on 2021/07/11.
//

import Foundation

public final class TodoListModel {
    public var todoList: [Todo]
    public let dataStore: TodoDataStore
    private let view: TodoListViewController
    
    init(dataStore: TodoDataStore, view: TodoListViewController) {
        self.todoList = dataStore.fetchAll()
        self.dataStore = dataStore
        self.view = view
    }
    
    public func addTodoList(todo: Todo) -> Result<[Todo], TodoDataStoreError> {
        let result: Result<[Todo], TodoDataStoreError>
        
        result = dataStore.add(todo)
        if case let .success(ids) = result {
            todoList = ids
        }
        
        view.updateViews(todos: todoList)
        return result
    }
    
    public func updateTodoList(todo: Todo) -> Result<[Todo], TodoDataStoreError> {
        let result: Result<[Todo], TodoDataStoreError>

        if let index = todoList.firstIndex(where: { $0.todoId == todo.todoId }) {
            todoList[index] = todo
        }
        
        result = dataStore.update(todoList)
        if case let .success(ids) = result {
            todoList = ids
        }
        
        view.updateViews(todos: todoList)
        return result
        
    }
    
    public func searchTodoList(searchText: String!) {
        var searchTodoList: [Todo]! = []
        
        if searchText.isEmpty {
            view.updateViews(todos: todoList)
            return
        }
        
        for todo in todoList {
            if todo.name.contains(searchText) {
                searchTodoList.append(todo)
            }
        }
        view.updateViews(todos: searchTodoList)
    }
    
}
