//
//  TodoAddPresenter.swift
//  swift_todo
//
//  Created by tk84 on 2021/08/22.
//

import Foundation

protocol TodoAddPresenterProtocol {
}

class TodoAddPresenter {

    private var view: TodoViewProtocol!
    private let useCase: TodoUseCase!

    init(view: TodoViewProtocol,
         useCase: TodoUseCase) {
        self.view = view
        self.useCase = useCase
    }


}

extension TodoAddPresenter: TodoAddPresenterProtocol {

}
