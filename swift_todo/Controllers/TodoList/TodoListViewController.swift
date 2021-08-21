//
//  TodoListViewController.swift
//  swift_todo
//
//  Created by tk84 on 2021/07/11.
//

import UIKit



class TodoListViewController: UIViewController {
    
    var model: TodoListModel!
    let customTableView = TodoTableView.instance()
    private var tableDataList: [Todo] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "MVC TODOLIST"
        self.tabBarItem.title = "TODO"
        
        
        customTableView.tableView.delegate = self
        customTableView.tableView.dataSource = self
        customTableView.searchBar.delegate = self
        
        customTableView.tableView.separatorStyle = .none
        customTableView.searchBar.enablesReturnKeyAutomatically = false
        
        self.view.addSubview(customTableView)
        
        model = TodoListModel(dataStore: TodoDataStoreImpl(), view: self)
        tableDataList = model.todoList
    }
    
    
    @IBAction func addTodoButton(_ sender: Any) {
        let addView = self.storyboard?.instantiateViewController(withIdentifier: "TodoListAddViewController") as! TodoListAddViewController
        
        self.present(addView, animated: true, completion: nil)
    }
    
    
    
    
}





extension TodoListViewController: UITableViewDataSource,UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return tableDataList.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: customTableView.cellIdentifier, for: indexPath) as! TodoCellView
        cell.delegate = self
        cell.label.text = tableDataList[indexPath.section].name
        cell.checkBox.isSelected = tableDataList[indexPath.section].isChecked
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let addView = self.storyboard?.instantiateViewController(withIdentifier: "TodoListAddViewController") as! TodoListAddViewController
        addView.todo = tableDataList[indexPath.section]
        
        self.present(addView, animated: true, completion: nil)
    }
    
    
    
    // layout
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 20  // Cell間に設けたい余白の高さを指定
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let marginView = UIView()
        marginView.backgroundColor = .clear  // 背景色を透過させる
        return marginView
    }
    
}

extension TodoListViewController {
    
    public func updateViews(todos: [Todo]) {
        tableDataList = todos
        customTableView.tableView.reloadData()
    }
    
}

extension TodoListViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        model.searchTodoList(searchText: searchText)
    }
}


extension TodoListViewController: TodoCellViewDelegate {
    func todoCellViewChecked(_ cell: TodoCellView, didChange sender: Any) {
        guard let indexPath = customTableView.tableView.indexPath(for: cell) else {
            return
        }
        var data = tableDataList[indexPath.section]
        data.isChecked.toggle()
        
        if case .success(_) = model.updateTodoList(todo: data) {
        }
        
    }
}
