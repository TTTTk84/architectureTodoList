//
//  TodoListAddViewController.swift
//  swift_todo
//
//  Created by tk84 on 2021/07/12.
//

import UIKit

class TodoListAddViewController: UIViewController {
    
    let customView = TodoModalView.instance()
    var vc: TodoListViewController!
    var todo: Todo!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let tab = self.presentingViewController as? UITabBarController,
           let nav = tab.selectedViewController as? UINavigationController,
           let v = nav.viewControllers.last
        {
            vc = v as? TodoListViewController
        }
        
        customView.submitButton.layer.cornerRadius = 10.0
        customView.submitButton.addTarget(self, action: #selector(submitEvent(_:)), for:  UIControl.Event.touchUpInside)
        
        customView.textView.layer.borderColor = UIColor.gray.cgColor
        customView.textView.layer.borderWidth = 1.0
        
        if let todo = todo {
            customView.textView.text = todo.name
        }
        
        
        self.view.addSubview(customView)
    }
    
    @objc func submitEvent(_ sender: UIButton) {
        if let todo = todo {
            var newTodo = todo
            newTodo.name = customView.textView.text
            if case .success(_) = vc.model.updateTodoList(todo: newTodo) {
            }
        } else {
            if case .success(_) = vc.model.addTodoList(todo: Todo(name: customView.textView.text)) {
            }
        }
        

        self.dismiss(animated: true, completion: nil)
    }
    
}
