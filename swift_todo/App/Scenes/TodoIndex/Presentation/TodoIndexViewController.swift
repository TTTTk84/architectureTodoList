//
//  TodoIndexViewController.swift
//  swift_todo
//
//  Created by tk84 on 2021/08/21.
//

import UIKit


protocol TodoViewProtocol: Transitioner {
    func reloadTableView()
}

class TodoIndexViewController: UIViewController {

    private var presenter: TodoIndexPresenterProtocol!
    private var todoTableView: UITableView = {
        let tableView = UITableView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return tableView
    }()

    func inject(presenter: TodoIndexPresenterProtocol) {
        self.presenter = presenter
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white

        self.view.addSubview(todoTableView)
        setupTodoTableView()
        setupNavigation()
    }

    // MARK: Private Methods

    private func setupTodoTableView() {
        self.todoTableView.delegate = self
        self.todoTableView.dataSource = self
        self.todoTableView.translatesAutoresizingMaskIntoConstraints = false
        self.todoTableView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        self.todoTableView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
        self.todoTableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 0).isActive = true
        self.todoTableView.widthAnchor.constraint(equalToConstant: widthValue).isActive = true
    }

    private func setupNavigation() {
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(onClick))
        self.navigationItem.rightBarButtonItem = addButton
    }

    @objc private func onClick() {
        self.presenter.tappedPlusButton()
    }

}

extension TodoIndexViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.presenter.numberOfUsers
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.todoTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let todo = self.presenter.checkTodoRow(forRow: indexPath.row)
        cell.textLabel?.text = todo?.name

        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return widthValue * 0.2
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.todoTableView.deselectRow(at: indexPath, animated: true)
        self.presenter.didSelectRow(at: indexPath)
    }
}

extension TodoIndexViewController: TodoViewProtocol {
    func reloadTableView() {
        self.todoTableView.reloadData()
    }
}
