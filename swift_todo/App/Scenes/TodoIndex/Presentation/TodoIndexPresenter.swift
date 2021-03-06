//
//  TodoPresenter.swift
//  swift_todo
//
//  Created by tk84 on 2021/08/21.
//

import Foundation

protocol TodoIndexPresenterProtocol {
    var numberOfUsers: Int { get }
    func didSelectRow(at indexPath: IndexPath)
    func checkTodoRow(forRow row: Int) -> Todo?
    func tappedPlusButton()    
}


class TodoIndexPresenter {
    private(set) var todoList: [Todo] = []

    private var view: TodoViewProtocol!
    private let useCase: TodoUseCase!
    private let router: TodoRouterProtocol!

    init(view: TodoViewProtocol,
         useCase: TodoUseCase,
         router: TodoRouterProtocol) {
        self.view = view
        self.useCase = useCase
        self.router = router
        self.useCase.output = self

        self.useCase.fetchAll()
    }

    // MARK: Private Methods

}

extension TodoIndexPresenter: TodoIndexPresenterProtocol {

    var numberOfUsers: Int {
        return self.todoList.count
    }

    func checkTodoRow(forRow row: Int) -> Todo? {
        guard row < todoList.count else { return nil }
        return todoList[row]
    }

    func didSelectRow(at indexPath: IndexPath) {
        guard let todo = checkTodoRow(forRow: indexPath.row) else { return }
        router.transitionToShow(todo: todo)
    }

    func tappedPlusButton() {
        self.router.transitionToAdd()
    }

}

extension TodoIndexPresenter: TodoUseCaseOutput {
    func useCaseDidUpdate(todoList: [Todo]) {
        self.todoList = todoList
        self.view.reloadTableView()
    }


}
