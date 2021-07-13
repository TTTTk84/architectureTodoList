//
//  TodoTableView.swift
//  swift_todo
//
//  Created by tk84 on 2021/07/11.
//

import UIKit

class TodoTableView: UIView {
    
    public let cellIdentifier = "TodoCellView"
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.register(UINib(nibName: cellIdentifier,
                                     bundle: Bundle(for: type(of: self))),
                               forCellReuseIdentifier: cellIdentifier)
        }
    }
    
    class func instance() -> TodoTableView {
        return UINib(nibName: "TodoTableView",
                     bundle: nil).instantiate(
                        withOwner: self,
                        options: nil)[0] as! TodoTableView
    }
    
    
    
    
}

