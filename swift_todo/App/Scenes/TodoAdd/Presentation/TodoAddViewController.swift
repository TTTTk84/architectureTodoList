//
//  TodoAddViewController.swift
//  swift_todo
//
//  Created by tk84 on 2021/08/21.
//

import  UIKit

class TodoAddViewController: UIViewController {

    private var presenter: TodoAddPresenterProtocol!
    private var todoFormView: TodoFormView!

    func inject(presenter: TodoAddPresenterProtocol) {
        self.presenter = presenter
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white

        self.setupTodoFormView()
        self.view.addSubview(todoFormView)
    }

    // MARK: Private Methods
    private func setupTodoFormView() {
        let Barheight = UIApplication.shared.statusBarFrame.height + (self.navigationController?.navigationBar.frame.size.height)!

        self.todoFormView = TodoFormView()

        self.todoFormView.setupValue(name: "", view: self)
        self.todoFormView.frame = CGRect(x: 0,
                                         y: Barheight,
                                         width: widthValue,
                                         height: heightValue - Barheight)
    }

}

extension TodoAddViewController: TodoViewProtocol {
    func reloadTableView() {
    }
}

extension TodoAddViewController: TodoFormViewProtocol {
    func tappedSendButton(sendText: String) {

    }


}
