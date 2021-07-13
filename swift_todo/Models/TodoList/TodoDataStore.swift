//
//  TodoDataStore.swift
//  swift_todo
//
//  Created by tk84 on 2021/07/11.
//

import Foundation

public protocol TodoDataStore {
    func fetchAll() -> [Todo]
    func add(_ todo: Todo) -> Result<[Todo], TodoDataStoreError>
    func update(_ todos: [Todo]) -> Result<[Todo], TodoDataStoreError>
}

public enum TodoDataStoreError: Error {
    case unknown
}

public struct TodoDataStoreImpl: TodoDataStore {
    
    
    
    enum Key: String {
        case todoIds = "TODO_IDS"
    }
    
    private let userDefaults = UserDefaults.standard
    
    public func fetchAll() -> [Todo] {
        let jsonDecoder = JSONDecoder()
        guard let data = userDefaults.data(forKey: Key.todoIds.rawValue),
              let todo = try? jsonDecoder.decode([Todo].self, from: data) else {
            print("kara")
            return [Todo]()
        }
        
        return todo
    }
    
    
    public func add(_ todo: Todo) -> Result<[Todo], TodoDataStoreError> {
        var list = fetchAll()
        list.append(todo)
        
        let jsonEncoder = JSONEncoder()
        guard let data = try? jsonEncoder.encode(list) else {
            return .failure(.unknown)
        }
        
        userDefaults.set(data, forKey: Key.todoIds.rawValue)
        if userDefaults.synchronize() {
            return .success(list)
        }
        
        return .failure(.unknown)
    }
    
    public func update(_ todos: [Todo]) -> Result<[Todo], TodoDataStoreError> {
        let jsonEncoder = JSONEncoder()
        guard let data = try? jsonEncoder.encode(todos) else {
            return .failure(.unknown)
        }
        
        userDefaults.set(data, forKey: Key.todoIds.rawValue)
        if userDefaults.synchronize() {
            return .success(todos)
        }
        
        return .failure(.unknown)
    }
    
    
}
