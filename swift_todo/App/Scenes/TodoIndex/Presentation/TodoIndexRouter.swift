//
//  TodoRouter.swift
//  swift_todo
//
//  Created by tk84 on 2021/08/21.
//

import UIKit

protocol TodoRouterProtocol  {
    func transitionToShow(todo: Todo)
    func transitionToAdd()
    func transitionToEdit(todo: Todo)

}


class TodoIndexRouter: TodoRouterProtocol {

    private(set) var view: TodoViewProtocol!
    private let useCase = Application.shared.useCase


    init(view: TodoViewProtocol) {
        self.view = view
    }

    func transitionToShow(todo: Todo) {
        //self.view.pushViewController(, animated: )
    }

    func transitionToAdd() {
        let todoAddViewController = TodoAddViewController()
        let todoAddPresenter = TodoAddPresenter(view: todoAddViewController,
                                                useCase: self.useCase!)
        todoAddViewController.inject(presenter: todoAddPresenter)
        self.view.pushViewController(todoAddViewController, animated: true)
    }

    func transitionToEdit(todo: Todo) {
    }

}
