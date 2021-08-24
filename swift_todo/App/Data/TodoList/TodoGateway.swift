//
//  TodoGateway.swift
//  swift_todo
//
//  Created by tk84 on 2021/08/21.
//

import Foundation

protocol TodoGatewayProtocol {
    func fetch(completion: ([Todo]) -> Void)
    func add(todo: Todo, completion: ([Todo]) -> Void)
}

class TodoGateway {

    var useCase: TodoUseCaseProtocol!
    var dataStore: TodoDataStore!

    init(useCase: TodoUseCaseProtocol) {
        self.useCase = useCase
    }
}

extension TodoGateway: TodoGatewayProtocol {



    func fetch(completion: ([Todo]) -> Void) {

        dataStore.fetch() { [weak self] todoResult in
            guard self != nil else { return }
            completion(todoResult)
        }
    }

    func add(todo: Todo, completion: ([Todo]) -> Void) {
        dataStore.add(todo: todo) { [weak self] todoResult in
            guard self != nil else { return }
            completion(todoResult)
        }
    }

    
}
