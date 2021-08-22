//
//  Application.swift
//  swift_todo
//
//  Created by tk84 on 2021/08/21.
//

import UIKit


class Application {

    static let shared = Application()
    private init() {}

    private(set) var useCase: TodoUseCase!

    func configure(with window: UIWindow) {
        buildLayer()

        let todoIndexViewController = TodoIndexViewController()
        let todoRouter = TodoRouter(view: todoIndexViewController)
        let todoIndexPresenter = TodoIndexPresenter(view: todoIndexViewController,
                                                    useCase: self.useCase,
                                                    router: todoRouter)
        todoIndexViewController.inject(presenter: todoIndexPresenter)
        window.rootViewController = todoIndexViewController
    }


    // MARK: Private Methods

    private func buildLayer() {
        self.useCase = TodoUseCase()
    }

}
